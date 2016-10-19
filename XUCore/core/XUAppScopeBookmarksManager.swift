//
//  FCAppScopeBookmarksManager.swift
//  XUCore
//
//  Created by Charlie Monroe on 11/11/15.
//  Copyright © 2015 Charlie Monroe Software. All rights reserved.
//

import Foundation


public final class XUAppScopeBookmarksManager: NSObject {
	
	public static var sharedManager = XUAppScopeBookmarksManager()

	fileprivate var _cache: [String : URL] = [ : ]
	
	fileprivate override init() {
		super.init()
	}
	
	/// Sets a URL for key. Returns if the save was successful.
	@discardableResult
	public func setURL(_ url: URL?, forKey defaultsKey: String) -> Bool {
		var newURL = url
		if newURL == nil {
			_cache.removeValue(forKey: defaultsKey)
			
			UserDefaults.standard.removeObject(forKey: defaultsKey)
		}else{
			// Make sure the path is different from the current one -> otherwise 
			// we probably haven't opened the open dialog -> will fail
			let savedURL = self.url(forKey: defaultsKey)
			if savedURL == nil || (savedURL! != newURL!) {
				#if os(iOS)
					NSUserDefaults.standardUserDefaults().setObject(URL!.absoluteString, forKey: defaultsKey)
				#else
					_ = newURL!.startAccessingSecurityScopedResource()
					
					guard let bookmarkData = try? (newURL! as NSURL).bookmarkData(options: .withSecurityScope, includingResourceValuesForKeys: [ ], relativeTo: nil) else {
						XULog("Failed to create bookmark data for URL \(newURL!)")
						return false
					}
					
					XULog("trying to save bookmark data for path \(newURL!.path) - bookmark data length = \(bookmarkData.count)")
					
					UserDefaults.standard.set(bookmarkData, forKey: defaultsKey)
					
					newURL!.stopAccessingSecurityScopedResource()
					
					let reloadedURL = try? (NSURL(resolvingBookmarkData: bookmarkData, options: .withSecurityScope, relativeTo: nil, bookmarkDataIsStale: nil) as URL)
					if reloadedURL != nil {
						newURL = reloadedURL
					}
				#endif
				
				_cache[defaultsKey] = newURL
				
				UserDefaults.standard.synchronize()
			}
		}
		
		return true
	}
	
	@available(*, deprecated, renamed: "url(forKey:)")
	public func URLForKey(_ defaultsKey: String) -> URL? {
		return self.url(forKey: defaultsKey)
	}
	
	/// Returns URL for key.
	public func url(forKey defaultsKey: String) -> URL? {
		if let result = _cache[defaultsKey] {
			return result
		}
		
		let result: URL?
		#if os(iOS)
			guard let absoluteURLString = NSUserDefaults.standardUserDefaults().stringForKey(defaultsKey) else {
				return nil
			}
			result = URL(string: absoluteURLString)
		#else
			guard let bookmarkData = UserDefaults.standard.data(forKey: defaultsKey) else {
				return nil
			}
		
			result = try? (NSURL(resolvingBookmarkData: bookmarkData, options: .withSecurityScope, relativeTo: nil, bookmarkDataIsStale: nil) as URL)
			XULog("resolved bookmark data (length: \(bookmarkData.count)) to \(result.descriptionWithDefaultValue())")
		#endif
		
		if result != nil {
			_cache[defaultsKey] = result
		}
		
		return result
	}
	
}

