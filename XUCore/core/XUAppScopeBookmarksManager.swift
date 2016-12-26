//
//  FCAppScopeBookmarksManager.swift
//  XUCore
//
//  Created by Charlie Monroe on 11/11/15.
//  Copyright © 2015 Charlie Monroe Software. All rights reserved.
//

import Foundation

public final class XUAppScopeBookmarksManager {
	
	public static var shared = XUAppScopeBookmarksManager()

	fileprivate var _cache: [XUPreferences.Key : URL] = [ : ]
	
	/// Sets a URL for key. Returns if the save was successful.
	@discardableResult
	public func setURL(_ url: URL?, forKey defaultsKey: XUPreferences.Key) -> Bool {
		var newURL = url
		if newURL == nil {
			_cache.removeValue(forKey: defaultsKey)
			
			XUPreferences.shared.perform(andSynchronize: { (prefs) in
				prefs.set(value: nil, forKey: defaultsKey)
			})
		}else{
			// Make sure the path is different from the current one -> otherwise 
			// we probably haven't opened the open dialog -> will fail
			let savedURL = self.url(forKey: defaultsKey)
			if savedURL == nil || (savedURL! != newURL!) {
				#if os(iOS)
					XUPreferences.shared.perform(andSynchronize: { (prefs) in
						prefs.set(value: url!.absoluteString, forKey: defaultsKey)
					})
				#else
					_ = newURL!.startAccessingSecurityScopedResource()
					
					guard let bookmarkData = try? (newURL! as NSURL).bookmarkData(options: .withSecurityScope, includingResourceValuesForKeys: [], relativeTo: nil) else {
						XULog("Failed to create bookmark data for URL \(newURL!)")
						return false
					}
					
					XULog("trying to save bookmark data for path \(newURL!.path) - bookmark data length = \(bookmarkData.count)")
					
					XUPreferences.shared.perform(andSynchronize: { (prefs) in
						prefs.set(value: bookmarkData, forKey: defaultsKey)
					})
					
					newURL!.stopAccessingSecurityScopedResource()
					
					var isStale: Bool = false
					do {
						let reloadedURL = try URL(resolvingBookmarkData: bookmarkData, options: .withSecurityScope, relativeTo: nil, bookmarkDataIsStale: &isStale)
						if reloadedURL != nil {
							newURL = reloadedURL
						}
					} catch _ { }
				#endif
				
				_cache[defaultsKey] = newURL
			}
		}
		
		return true
	}
	
	/// Returns URL for key.
	public func url(forKey defaultsKey: XUPreferences.Key) -> URL? {
		if let result = _cache[defaultsKey] {
			return result
		}
		
		let result: URL?
		#if os(iOS)
			guard let absoluteURLString: String = XUPreferences.shared.value(for: defaultsKey) else {
				return nil
			}
			result = URL(string: absoluteURLString)
		#else
			guard let bookmarkData: Data = XUPreferences.shared.value(for: defaultsKey) else {
				return nil
			}
		
			do {
				var isStale: Bool = false
				result = try URL(resolvingBookmarkData: bookmarkData, options: .withSecurityScope, relativeTo: nil, bookmarkDataIsStale: &isStale)
			} catch _ {
				result = nil
			}
			
			XULog("resolved bookmark data (length: \(bookmarkData.count)) to \(result.descriptionWithDefaultValue())")
		#endif
		
		if result != nil {
			_cache[defaultsKey] = result
		}
		
		return result
	}
	
}

