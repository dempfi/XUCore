//
//  XUPreferences.swift
//  XUCore
//
//  Created by Charlie Monroe on 9/29/16.
//  Copyright © 2016 Charlie Monroe Software. All rights reserved.
//

import Foundation

/// If your extension of XUPreferences implements XUReflectablePreferences,
/// the preferences will be dumped into the debug log on init() and application
/// state provider will include them as well.
public protocol XUReflectablePreferences {
	
	var dictionaryRepresentation: XUJSONDictionary { get }
	
}

/// Extension to XUReflectablePreferences that serializes dictionaryRepresentation
/// into a loggable string.
public extension XUReflectablePreferences {
	
	/// Logs preferences using XULog.
	func log() {
		XULog(self.logString)
	}
	
	/// Creates a string containing the reflectable properties (see XUReflectablePreferences).
	/// Will return nil, if you haven't implemented the reflectable protocol.
	var logString: String {
		let dictItems = self.dictionaryRepresentation.sorted(by: { $0.0 < $1.0 })
		
		var result: [String] = []
		result.append("===================== XUPreferences =====================")
		
		for (key, value) in dictItems {
			result.append("| \(key) - \(value)")
		}
		
		result.append("=========================================================")
		return result.joined(separator: "\n")
	}
	
	/// State item.
	var preferencesStateItem: XUApplicationStateItem {
		return XUApplicationStateItem(name: "Preferences", andValue: "\n" + self.logString.lines.map({ "\t" + $0 }).joined(separator: "\n"), requiresAdditionalTrailingNewLine: true)
	}
	
}


/// Preferences. It is a struct, should not be subclassed, the only thing that
/// you should do is create an extension that contains computed variables for getting
/// and setting values. These vars should use the API of XUPreferences for storing
/// items. The setters should be declared as nonmutating as there are no mutable
/// instances passed around.
public struct XUPreferences {
	
	/// This is a struct that identifies a key for the preferences.
	/// TODO - make it generic - this would allow some great stuff with it, but
	/// current versions of Swift do not support static stored properties on
	/// generic types, which would make all the extensions of Key with static
	/// let's incompatible.
	public struct Key: RawRepresentable, Hashable {
		
		public var hashValue: Int {
			return self.rawValue.hashValue
		}
		
		/// Raw value of the key.
		public var rawValue: String
		
		/// Initializer.
		public init(_ rawValue: String) {
			self.rawValue = rawValue
		}
		
		/// Initializer.
		public init(rawValue: String) {
			self.rawValue = rawValue
		}
		
	}
	
	private static var _shared: XUPreferences?
	
	/// Returns true iff the shared preferences have been inited.
	public static var isApplicationUsingPreferences: Bool {
		return _shared != nil
	}
	
	/// Returns the shared preferences.
	public static var shared: XUPreferences {
		if _shared == nil {
			_shared = XUPreferences()
			
			// Calling the reflectable preferences here instead of in the init()
			// method avoids infinite recursion if the reflectable preferences
			// need to use XUPreferences.shared.
			if let reflectable = _shared as? XUReflectablePreferences {
				reflectable.log()
			}
		}
		
		return _shared!
	}
	
	
	/// Key modifier. For example, if you need to store per-document preferences,
	/// you may init them with a `keyModifier` that adds document UUID to the key.
	/// XUPreferences' accessors (boolean(for:), etc.) then invoke this modifier
	/// to get the modified key.
	public let keyModifier: (String) -> String
	
	/// Inits self and if is reflectable, dumps contents into the log. See the
	/// `keyModifier`
	public init(keyModifier: @escaping (String) -> String = { $0 }) {
		self.keyModifier = keyModifier
	}
	
	/// Executes the block and calls synchronize on UserDefaults. This is the
	/// preferred way of modifying multiple prefereences at once - call this method
	/// with a block that sets various values and ensures that the synchronization
	/// is performed.
	public func perform(andSynchronize block: (XUPreferences) -> ()) {
		block(self)
		
		UserDefaults.standard.synchronize()
	}
	
}

/// Default getters.
public extension XUPreferences {
	
	/// Fetches boolean for key.
	func boolean(for key: Key, defaultValue: Bool = false) -> Bool {
		guard let value = UserDefaults.standard.object(forKey: self.keyModifier(key.rawValue)) as? NSNumber else {
			return defaultValue
		}
		return value.boolValue
	}
	
	/// Decodes a codable object into preferences for a key.
	func decode<T: Codable>(for key: Key) -> T? {
		guard let data: Data = self.value(for: key) else {
			return nil
		}
		
		do {
			let decoder = PropertyListDecoder()
			let obj = try decoder.decode(T.self, from: data)
			return obj
		} catch let error {
			print("Failed to decode value for \(key.rawValue): \(error)")
			return nil
		}
	}

	/// Decodes a codable object into preferences for a key with a default value.
	func decode<T: Codable>(for key: Key, defaultValue: @autoclosure () -> T) -> T {
		return self.decode(for: key) ?? defaultValue()
	}
		
	/// Fetches integer for key.
	func integer(for key: Key, defaultValue: Int = 0) -> Int {
		guard let value = UserDefaults.standard.object(forKey: self.keyModifier(key.rawValue)) as? NSNumber else {
			return defaultValue
		}
		return value.intValue
	}
	
	/// Fetches a raw representable for key.
	func rawRepresentable<T: RawRepresentable>(for key: Key) -> T? {
		guard let value = UserDefaults.standard.object(forKey: self.keyModifier(key.rawValue)) as? T.RawValue else {
			return nil
		}
		
		return T(rawValue: value)
	}

	/// Fetches a raw representable for key with default value.
	func rawRepresentable<T: RawRepresentable>(for key: Key, defaultValue: @autoclosure () -> T) -> T {
		return self.rawRepresentable(for: key) ?? defaultValue()
	}
	
	/// Fetches a value for key.
	func value<T>(for key: Key) -> T? {
		return UserDefaults.standard.object(forKey: self.keyModifier(key.rawValue)) as? T
	}
	
	/// Fetches a value with default value for key.
	func value<T>(for key: Key, defaultValue: T) -> T {
		guard let obj = UserDefaults.standard.object(forKey: self.keyModifier(key.rawValue)) as? T else  {
			return defaultValue
		}
		return obj
	}
	
}

/// Default setters.
public extension XUPreferences {

	/// Encodes a codable object into preferences for a key. Throws if the encode
	/// fails.
	func encode<T: Encodable>(_ obj: T, forKey key: Key) throws {
		let encoder = PropertyListEncoder()
		let payload = try encoder.encode(obj)
		
		self.set(value: payload, forKey: key)
	}
	
	/// Sets boolean for key.
	func set(boolean value: Bool, forKey key: Key) {
		UserDefaults.standard.set(value, forKey: self.keyModifier(key.rawValue))
	}
	
	/// Sets integer for key.
	func set(integer value: Int, forKey key: Key) {
		UserDefaults.standard.set(value, forKey: self.keyModifier(key.rawValue))
	}
	
	func set<T: RawRepresentable>(rawRepresentable: T, for key: Key) {
		return self.set(value: rawRepresentable.rawValue, forKey: key)
	}

	/// Sets a value for key. Note that the value is passed to UserDefaults,
	/// so the value needs to be ObjC compatible.
	func set(value: Any?, forKey key: Key) {
		if value == nil {
			UserDefaults.standard.removeObject(forKey: self.keyModifier(key.rawValue))
		} else {
			UserDefaults.standard.set(value, forKey: self.keyModifier(key.rawValue))
		}
	}
	
}

