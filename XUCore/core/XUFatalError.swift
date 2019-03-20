//
//  XUAbstract.swift
//  DownieCore
//
//  Created by Charlie Monroe on 8/12/15.
//  Copyright © 2015 Charlie Monroe Software. All rights reserved.
//

import Foundation

public protocol XUFatalErrorObserver {
	
	func fatalErrorDidOccur(with reason: String)
	
}

public struct XUFatalErrorObservation {
	
	fileprivate static var _observers: [XUFatalErrorObserver] = []
	
	/// Adds an observer for XUFatalError.
	public static func addObserver(_ observer: XUFatalErrorObserver) {
		_observers.append(observer)
	}
	
}


/// The advantage of this is that unlike fatalError, this will include file,
/// line and method in the reason of fatalError.
public func XUFatalError(_ additionalInformation: String = "", file: String = #file, line: Int = #line, method: String = #function) -> Never  {
	let reason = "XUFatalError: [\(file.components(separatedBy: "/").last!):\(line) \(method)] \(additionalInformation)"
	XULogStacktrace(reason)
	
	XUFatalErrorObservation._observers.forEach({ $0.fatalErrorDidOccur(with: reason) })
	
	fatalError(reason)
}

