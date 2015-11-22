//
//  XUExceptionCatcher.swift
//  XUCore
//
//  Created by Charlie Monroe on 11/22/15.
//  Copyright © 2015 Charlie Monroe Software. All rights reserved.
//

import Foundation
import ExceptionHandling

/// This class catches all uncaught exceptions and displays a message about
/// the exception, allowing the user to send a report.
public class XUExceptionCatcher: NSObject {
	
	/// Contains the shared catcher. You should not call this, unless the exception
	/// reporting is enabled.
	public static let sharedExceptionCatcher = XUExceptionCatcher()
	
	/// This is called automatically by _XUCoreLauncher and starts exception
	/// handling. If, however, no exception handler reporting URL is found in
	/// XUApplicationSetup, the catcher does not start. See XUExceptionReporter
	/// for more information.
	public class func startExceptionCatcher() {
		if XUApplicationSetup.sharedSetup.exceptionHandlerReportURL == nil {
			return
		}
		
		// Force initialization.
		_ = XUExceptionCatcher.sharedExceptionCatcher
	}
	
	/// Registers the exception handler.
	@objc private func _registerExceptionHandler() {
		let handler = NSExceptionHandler.defaultExceptionHandler()
		handler.setDelegate(self)
		
		let mask = (NSHandleUncaughtExceptionMask | NSHandleUncaughtSystemExceptionMask | NSHandleUncaughtRuntimeErrorMask)
		handler.setExceptionHandlingMask(mask)
		handler.setExceptionHangingMask(0)
	}
	
	@objc public override func exceptionHandler(sender: NSExceptionHandler!, shouldHandleException exception: NSException!, mask aMask: Int) -> Bool {
		
		// This method can be called from any thread, under any circumstances,
		// which is why we just note down the exception and we periodically check
		// for it in _checkForException.
		
		let stackTrace = NSThread.callStackSymbols().joinWithSeparator("\n")
		
		XUExceptionReporter.showReporterForException(exception, andStackTrace: stackTrace)
		return true
	}
	
	private override init() {
		super.init()
		
		// Since NSApplication installs its own handler, we need to make sure that
		// this is called *after* the app is finished launching. We can detect this
		// by checking NSApp for nil.
		if NSApp == nil {
			// App not yet fully launched, defer the handler registration.
			NSNotificationCenter.defaultCenter().addObserver(self, selector: "_registerExceptionHandler", name: NSApplicationDidFinishLaunchingNotification, object: nil)
		}else{
			// The app is fully launched.
			self._registerExceptionHandler()
		}
	}
	
}
