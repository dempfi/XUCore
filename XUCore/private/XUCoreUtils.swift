//
//  XUCoreUtils.swift
//  XUCore
//
//  Created by Charlie Monroe on 11/22/15.
//  Copyright © 2015 Charlie Monroe Software. All rights reserved.
//
//  This file contains a few methods that are meant for internal use within the
//  XUCore(Mobile) framework.
//

import Foundation

extension Bundle {
	
	/// Returns the core bundle.
	public static let core: Bundle = Bundle(for: _XUSwiftCoreLoader.self)
	
}

/// Private class that loads all the singletons in XUCore. This is called by 
/// _XUCoreLoader which implements +load which is not available in Swift. We need,
/// however, the loader to be in Swift since not all classes are NSObject-based
/// anymore.
@objc(_XUSwiftCoreLoader) public class _XUSwiftCoreLoader: NSObject {
	
	private static var _didLoad: Bool = false
	
	@objc public final class func loadSingletons() {
		guard !_didLoad else {
			fatalError("Calling _XUSwiftCoreLoader for the second time.")
		}
		
		_didLoad = true
		
		// First, load the application setup.
		_ = XUApplicationSetup.shared
		
		XUPreferences.shared.perform { (prefs) in
			prefs.launchCount += 1
		}
	}
	
}
