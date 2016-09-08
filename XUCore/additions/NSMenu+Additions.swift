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
	public func addItems(_ menuItems: [NSMenuItem]) {
		menuItems.forEach({ self.addItem($0) })
	}
	
}
