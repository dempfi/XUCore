//
//  XUExceptionReporter.swift
//  XUCore
//
//  Created by Charlie Monroe on 11/22/15.
//  Copyright © 2015 Charlie Monroe Software. All rights reserved.
//

import Cocoa
import XUCore

/// This class handles showing the exception dialog to the user and sending the
/// report. The report is sent to a URL defined in XUApplicationSetup.
///
/// The report sent to the URL is a JSON dictionary in HTTP body which contains
/// the following keys and values (all values are strings):
///
/// build - build number of the app
/// description - user's description of the exception
/// email - email of the user
/// exception - exception string. Contains name of the exception, reason and the
///				userInfo dictionary
/// name - name of the app
/// os_version - version of the OS. On 10.9, this is whatever NSProcessInfo.
///				operatingSystemVersionString returns, on OS X 10.10+, it is
///				operatingSystemVersion values combined using a dot.
/// stacktrace - stack trace string.
/// version - version of the app
final class XUExceptionReporter: NSObject, NSWindowDelegate {
	
	/// Contains a list of reporters being currently displayed.
	private static var _reporters: [XUExceptionReporter] = [ ]
	
	/// Shows an alert with privacy information.
	class func showPrivacyInformation() {
		let alert = NSAlert()
		alert.messageText = XULocalizedString("We value your feedback and wouldn't dare to collect any unwanted information. Your email address will not be stored anywhere and will only be used to inform you when this issue might be fixed or when we need more information in order to fix this problem.", inBundle: .core)
		alert.informativeText = XULocalizedString("Only the following information will be sent:\n• The description you provide.\n• The exception information below.\n• Version of this application.\n• Version of your system (OS).\n• Model of your computer (no MAC address or similar information that could identify your computer).", inBundle: .core)
		alert.addButton(withTitle: XULocalizedString("OK", inBundle: .core))
		alert.runModal()
	}
	
	/// Shows a new reporter window with the exception.
	class func showReporter(for exception: NSException, thread: Thread, queue: OperationQueue?, andStackTrace stackTrace: String) {
		if [NSExceptionName.portTimeoutException, NSExceptionName.objectInaccessibleException].contains(exception.name) {
			// Exceptions that commonly arise in Apple's code
			return
		}
		
		DispatchQueue.main.syncOrNow {
			let reporter = XUExceptionReporter(exception: exception, thread: thread, queue: queue, stackTrace: stackTrace)
			_reporters.append(reporter)
			
			reporter._reporterWindow.center()
			reporter._reporterWindow.makeKeyAndOrderFront(nil)
			
			NSAccessibility.post(element: reporter._reporterWindow!, notification: .announcementRequested, userInfo: [
				.announcement: XULocalizedFormattedString("%@ has encountered an issue and will crash. A report dialog will be presented. Please, submit it, or close the window in case you want to ignore the crash.", ProcessInfo().processName, inBundle: .core),
				.priority: NSAccessibilityPriorityLevel.high.rawValue
			])
			
			NSApp.runModal(for: reporter._reporterWindow)
			
			if XUPreferences.isApplicationUsingPreferences {
				XUPreferences.shared.perform(andSynchronize: { (prefs) in
					prefs.lastLaunchDidCrash = true
					prefs.numberOfConsecutiveCrashes += 1
				})
			}
			
			exit(1)
		}
	}
	
	
	private let _exception: NSException
	private let _queue: OperationQueue?
	private let _thread: Thread
	
	private let _nib: NSNib
	
	private var _topLevelObjects: NSArray? = []
	
	private let _updateChecker: XUUpdateChecker = XUUpdateChecker()
	
	@IBOutlet private var _reporterWindow: NSWindow!
	
	@IBOutlet private weak var _emailTextField: NSTextField!
	@IBOutlet private weak var _informationLabel: NSTextField!
	@IBOutlet private var _stackTraceTextView: NSTextView!
	@IBOutlet private var _updateInfoView: NSView!
	@IBOutlet private var _userInputTextView: NSTextView!
	
	
	private func _proceedSendingReportAfterDescriptionValidation() {
		let osVersion = ProcessInfo.processInfo.operatingSystemVersion
		let osVersionString = "\(osVersion.majorVersion).\(osVersion.minorVersion).\(osVersion.patchVersion)"
		
		let reportDictionary = [
			"description": _userInputTextView.string,
			"exception": "Name: \(_exception.name)\nReason: \(_exception.reason ?? "")\nFurther info: \(_exception.userInfo ?? [:])\nThread: \(_thread)\nQueue: \(_queue.descriptionWithDefaultValue())",
			"stacktrace": _stackTraceTextView.string,
			"version": XUAppSetup.applicationVersionNumber,
			"build": XUAppSetup.applicationBuildNumber,
			"name": ProcessInfo.processInfo.processName,
			"os_version": osVersionString,
			"email": _emailTextField.stringValue
		]
		
		/// The exception catcher doesn't even start without a valid URL. We assume
		/// that it's still valid. This class is internal, so there should be no
		/// calls to this from outside of XUCore.
		let url = XUAppSetup.exceptionHandlerReportURL!
		
		
		var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 20.0)
		request.contentType = URLRequest.ContentType.json
		request.httpMethod = "POST"
		request.setJSONBody(reportDictionary)
		
		let loader = XUSynchronousDataLoader(request: request)
		let result = try? loader.loadData()
		guard let response = result?.1 as? HTTPURLResponse else {
			self._reportFailedReportSend()
			return
		}
		
		if response.statusCode >= 200 && response.statusCode < 300 {
			let alert = NSAlert()
			alert.messageText = XULocalizedString("Thank you for the report!", inBundle: .core)
			alert.informativeText = XULocalizedString("We'll fix it as soon as possible!", inBundle: .core)
			alert.addButton(withTitle: XULocalizedString("OK", inBundle: .core))
			alert.beginSheetModal(for: _reporterWindow, completionHandler: { (_) -> Void in
				self._reporterWindow.close()
			})
		}else{
			self._reportFailedReportSend()
		}
	}
	
	private func _processUpdateResult(_ result: XUUpdateChecker.Result) {
		switch result {
		case let .majorUpdateAvailable(version: version):
			self._showUpdateInformation(for: version)
		case let .minorUpdateAvailable(version: version):
			self._showUpdateInformation(for: version)
		default:
			break
		}
	}
	
	private func _reportFailedReportSend() {
		let alert = NSAlert()
		alert.messageText = XULocalizedString("Could not post your report.", inBundle: .core)
		alert.informativeText = XULocalizedString("Check your Internet connection and try again.", inBundle: .core)
		alert.addButton(withTitle: XULocalizedString("OK", inBundle: .core))
		alert.beginSheetModal(for: _reporterWindow, completionHandler: nil)
	}
	
	private func _showUpdateInformation(for version: XUUpdateChecker.Version) {
		_updateInfoView.isHidden = false
	}
	
	private func _validateDescriptionText() -> Bool {
		let text = _userInputTextView.string.trimmingWhitespace
		guard !text.isEmpty else {
			return false
		}
		
		guard text.count > 10 else {
			return false
		}
		
		return true
	}
	
	@IBAction func downloadUpdate(_ sender: Any?) {
		if XUAppSetup.buildType == .appStore {
			if let appStoreURL = _updateChecker.appStoreURL {
				NSWorkspace.shared.open(appStoreURL)
			} else {
				NSWorkspace.shared.open(URL(fileURLWithPath: "/Applications/App Store.app"))
			}
		} else if let updateURL = _updateChecker.updateURL {
			NSWorkspace.shared.open(updateURL)
		} else if let supportURL = XUAppSetup.supportURL {
			NSWorkspace.shared.open(supportURL)
		} else {
			// Not sure what to do otherwise.
			NSWorkspace.shared.open(URL(fileURLWithPath: "/Applications/App Store.app"))
		}
	}
	
	private init(exception: NSException, thread: Thread, queue: OperationQueue?, stackTrace: String) {
		_exception = exception
		_thread = thread
		_queue = queue
		
		_nib = NSNib(nibNamed: "ExceptionReporter", bundle: .coreUI)!
		
		super.init()
		
		_nib.instantiate(withOwner: self, topLevelObjects: &_topLevelObjects)
		
		_updateInfoView.isHidden = true
		
		_reporterWindow.delegate = self
		_reporterWindow.isMovableByWindowBackground = true
		_reporterWindow.localize(from: .core)
		

		
		_stackTraceTextView.string = stackTrace
		_stackTraceTextView.font = NSFont.userFixedPitchFont(ofSize: 11.0)
		
		_updateChecker.checkForUpdates { [weak self] (result) in
			self?._processUpdateResult(result)
		}

	}
	
	@IBAction func quit(_ sender: Any?) {
		let alert = NSAlert()
		alert.messageText = XULocalizedString("Please consider submitting this report. We can't fix what we don't know is broken.", inBundle: .core)
		alert.informativeText = XULocalizedString("Submitting this report allows us to fix the issue.", inBundle: .core)
		alert.addButton(withTitle: XULocalizedString("OK", inBundle: .core))
		alert.addButton(withTitle: XULocalizedString("Quit Anyway", inBundle: .core))
		alert.beginSheetModal(for: _reporterWindow) { (response) in
			guard response == .alertSecondButtonReturn else {
				return
			}
			
			exit(0)
		}
	}
	
	@IBAction func sendReport(_ sender: AnyObject?) {
		let valid = XUEmailFormatValidity(email: _emailTextField.stringValue)
		
		if valid == .phony {
			let alert = NSAlert()
			alert.messageText = XULocalizedString("Heh, nice try. Please, enter a valid email address.", inBundle: .core)
			alert.informativeText = XULocalizedString("We may need to get in touch with you in order to fix this. We don't bite, we won't sell the email address to anyone nor use it in any other way. We promise.", inBundle: .core)
			alert.addButton(withTitle: XULocalizedString("OK", inBundle: .core))
			alert.beginSheetModal(for: _reporterWindow, completionHandler: nil)
			return
		} else if valid == .wrong {
			let alert = NSAlert()
			alert.messageText = XULocalizedString("You need to enter a valid email address.", inBundle: .core)
			alert.informativeText = XULocalizedString("We may need to get in touch with you in order to fix this.", inBundle: .core)
			alert.addButton(withTitle: XULocalizedString("OK", inBundle: .core))
			alert.beginSheetModal(for: _reporterWindow, completionHandler: nil)
			return
		}
		
		if !self._validateDescriptionText() {
			let alert = NSAlert()
			alert.messageText = XULocalizedString("Please, consider providing some circumstances under which this issue happened.", inBundle: .core)
			alert.informativeText = XULocalizedString("Include information about ongoing tasks in the application, if the application was in the foreground, or background; if you have clicked on anything, etc. Trying to figure out the bug just from the report can be hard and without additional information impossible.", inBundle: .core)
			alert.addButton(withTitle: XULocalizedString("OK", inBundle: .core))
			alert.addButton(withTitle: XULocalizedString("Send Anyway", inBundle: .core))
			alert.beginSheetModal(for: _reporterWindow, completionHandler: { (response) in
				guard response == .alertSecondButtonReturn else {
					self._reporterWindow.makeFirstResponder(self._userInputTextView)
					return
				}
				
				self._proceedSendingReportAfterDescriptionValidation()
			})
			return
		}
		
		if _userInputTextView.string.contains(where: { !($0.isASCII || $0.isPunctuation) }) {
			let alert = NSAlert()
			alert.messageText = XULocalizedFormattedString("Your message contains special characters which usually indicates that the message is not written in English. Please note that while %@ is translated into various languages, support is provided in English only. Thank you for understanding.", ProcessInfo.processInfo.processName, inBundle: .core)
			alert.informativeText = XULocalizedString("You can send the report anyway, but if the message indeed isn't in English, I won't be able to provide you with full support.", inBundle: .core)
			alert.addButton(withTitle: XULocalizedString("OK", inBundle: .core))
			alert.addButton(withTitle: XULocalizedString("Send Anyway", inBundle: .core))
			alert.beginSheetModal(for: _reporterWindow, completionHandler: { (response) in
				guard response == .alertSecondButtonReturn else {
					self._reporterWindow.makeFirstResponder(self._userInputTextView)
					return
				}
				
				self._proceedSendingReportAfterDescriptionValidation()
			})
			return
		}
		
		if !_updateInfoView.isHidden {
			// We're showing update info.
			let alert = NSAlert()
			alert.messageText = XULocalizedString("There is an update available.", inBundle: .core)
			alert.informativeText = XULocalizedString("It is possible that the new version has this issue fixed. Try updating this application. If you can't access the update feature of this application, redownload the application from its webpage.", inBundle: .core)
			alert.addButton(withTitle: XULocalizedString("Download Update...", inBundle: .core))
			alert.addButton(withTitle: XULocalizedString("Send Anyway", inBundle: .core))
			
			alert.beginSheetModal(for: _reporterWindow, completionHandler: { (response) in
				guard response == .alertSecondButtonReturn else {
					self.downloadUpdate(nil)
					return
				}
				
				self._proceedSendingReportAfterDescriptionValidation()
			})
			return
		}
		
		self._proceedSendingReportAfterDescriptionValidation()
	}
	
	@IBAction func showPrivacyInformation(_ sender: AnyObject?) {
		XUExceptionReporter.showPrivacyInformation()
	}
	
	func window(_ window: NSWindow, willPositionSheet sheet: NSWindow, using rect: CGRect) -> CGRect {
		var frame = window.frame
		frame.origin.x = 5.0
		frame.origin.y = frame.size.height - 22.0
		frame.size.width -= 10.0
		frame.size.height = 0.0
		return frame
	}
	
	func windowWillClose(_ notification: Notification) {
		guard let index = XUExceptionReporter._reporters.firstIndex(of: self) else {
			return
		}
		
		NSApp.stopModal()
		XUExceptionReporter._reporters.remove(at: index)
	}

}

