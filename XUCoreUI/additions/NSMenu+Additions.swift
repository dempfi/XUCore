//
//  NSMenu+Additions.swift
//  XUCore
//
//  Created by Charlie Monroe on 8/15/16.
//  Copyright © 2016 Charlie Monroe Software. All rights reserved.
//

import AppKit

public extension NSMenu {
	
	/// Adds menu items to the menu. A convenience method so that one can use
	/// array.map() to create menu items.
	func addItems(_ menuItems: [NSMenuItem]) {
		menuItems.forEach({ self.addItem($0) })
	}
	
}

public extension NSMenuItem {
	
	/// Convenience initializer that passes nil as action and empty key equivalent.
	convenience init(title: String) {
		self.init(title: title, action: nil, keyEquivalent: "")
	}
	
	/// Convenience initializer that takes `target` instead of `keyEquivalent`.
	convenience init(title: String, target: AnyObject?, action: Selector?) {
		self.init(title: title, action: action, keyEquivalent: "")
		self.target = target
	}
	
}

