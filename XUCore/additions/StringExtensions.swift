//
//  StringExtensions.swift
//  DownieCore
//
//  Created by Charlie Monroe on 8/6/15.
//  Copyright © 2015 Charlie Monroe Software. All rights reserved.
//

import Foundation

#if os(OSX)
	import Cocoa
#endif

/// + operator for String + Character
public func + (lhs: String, rhs: Character) -> String {
	return lhs + String(rhs)
}

/// + operator for String + Character
public func + (inout lhs: String, rhs: Character) {
	lhs = lhs + String(rhs)
}

infix operator =+ {
	associativity right
	precedence 90
	assignment
}

/// Similar to += - this operator
@available(*, deprecated, message="Use prepend instead.")
public func =+ (inout lhs: String, rhs: String) {
	lhs = rhs + lhs
}



public enum XUEmailValidationFormat {
	
	/// Correct format.
	case Correct
	
	/// Wrong. Missing @ sign, etc.
	case Wrong
	
	/// Phony. E.g. a@a.com.
	case Phony
	
}


public extension String {

	/// Creates a new UUID string.
	public static var UUIDString: String {
		let UIDRef = CFUUIDCreate(nil)
		let UID = CFUUIDCreateString(nil, UIDRef)
		return UID as String
	}
	
	
	/// Decodes `self` as base64-encoded `NSData` and tries to create a string
	/// from the result.
	public var base64DecodedString: String? {
		guard let data = NSData(base64EncodedString: self, options: .IgnoreUnknownCharacters) else {
			return nil
		}
		
		return String(data: data)
	}

	/// Returns true if the other string is not empty and is contained in self
	/// case-insensitive.
	public func containsCaseInsensitiveString(otherString: String) -> Bool {
		if otherString.isEmpty {
			return false
		}
		return self.rangeOfString(otherString, options: .CaseInsensitiveSearch) != nil
	}

	/// Draws `self` centered in rect with attributes.
	public func drawCenteredInRect(rect: CGRect, withAttributes atts: [String: AnyObject]? = nil) -> CGRect {
		let stringSize = self.sizeWithAttributes(atts)
		self.drawAtPoint(CGPoint(x: rect.midX - stringSize.width / 2.0, y: rect.midY - stringSize.height / 2.0), withAttributes: atts)
		return CGRect(x: rect.midX - stringSize.width / 2.0, y: rect.midY - stringSize.height / 2.0, width: stringSize.width, height: stringSize.height)
	}

	/// Draws `self` aligned right to point.
	func drawRightAlignedToPoint(point: CGPoint, withAttributes atts: [String: AnyObject]? = nil) -> CGSize {
		let s = self.sizeWithAttributes(atts)
		self.drawAtPoint(CGPoint(x: point.x - s.width, y: point.y), withAttributes: atts)
		return s
	}

	/// Returns the first character or \0 if the string is empty.
	public var firstCharacter: Character {
		return self.characters.first ?? Character(UInt8(0))
	}

	/// Returns first line of string. Always non-nil
	public var firstLine: String {
		return self.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())[0]
	}

	/// This converts string to UInt as a fourCharCode
	public var fourCharCodeValue: Int {
		var result: Int = 0
		if let data = self.dataUsingEncoding(NSMacOSRomanStringEncoding) {
			let bytes = UnsafePointer<UInt8>(data.bytes)
			for i in 0 ..< data.length {
				result = result << 8 + Int(bytes[i])
			}
		}
		return result
	}

	/// Returns true if the receiver has prefix `prefix` in case-insensitive
	/// comparison.
	public func hasCaseInsensitivePrefix(prefix: String) -> Bool {
		guard let range = self.rangeOfString(prefix, options: .CaseInsensitiveSearch) else {
			return false
		}

		return range.startIndex == self.startIndex
	}

	/// Returns true if the receiver has `substring` in case-insensitive
	/// comparison.
	public func hasCaseInsensitiveSubstring(substring: String) -> Bool {
		return self.rangeOfString(substring, options: .CaseInsensitiveSearch) != nil
	}

	/// Returns true if the receiver has prefix `suffix` in case-insensitive
	/// comparison.
	public func hasCaseInsensitiveSuffix(suffix: String) -> Bool {
		guard let range = self.rangeOfString(suffix, options: .CaseInsensitiveSearch) else {
			return false
		}

		return range.endIndex == self.endIndex
	}

	/// Returns hexValue of the string.
	public var hexValue: Int {
		let components = self.componentsSeparatedByString("x")
		var suffix = components.count < 2 ? self : components[1]
		suffix = suffix.stringByTrimmingLeftCharactersInSet(NSCharacterSet(charactersInString: "0"))

		var result = 0
		for c in self.characters {
			if c >= Character("0") && c <= Character("9") {
				result *= 16
				result += Int(c.UTF8Value - Character("0").UTF8Value)
			} else if c >= Character("a") && c <= Character("f") {
				result *= 16
				result += Int(c.UTF8Value - Character("a").UTF8Value) + 10
			} else if c >= Character("A") && c <= Character("F") {
				result *= 16
				result += Int(c.UTF8Value - Character("A").UTF8Value) + 10
			} else {
				break
			}
		}
		return result
	}

	/// Replaces & -> &amp; etc.
	public var HTMLEscapedString: String {
		var string = self
		string = string.stringByReplacingOccurrencesOfString("&", withString: "&amp;", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString("\"", withString: "&quot;", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString("'", withString: "&#x27;", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString(">", withString: "&gt;", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString("<", withString: "&lt;", options: .LiteralSearch)
		return string
	}

	/// Replaces &amp; -> & etc.
	public var HTMLUnescapedString: String {
		var string = self
		string = string.stringByReplacingOccurrencesOfString("&nbsp;", withString: " ", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString("&amp;", withString: "&", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString("&quot;", withString: "\"", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString("&gt;", withString: ">", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString("&lt;", withString: "<", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString("&apos;", withString: "'", options: .LiteralSearch)
		string = string.stringByReplacingOccurrencesOfString("&reg;", withString: "®", options: .LiteralSearch)

		let regex = XURegex(pattern: "&#(?P<C>x?[0-9a-f]);", andOptions: .Caseless)
		let allOccurrences = self.allValuesOfVariableNamed("C", forRegex: regex).distinct()
		for occurrence in allOccurrences {
			let value: Int
			if occurrence.hasPrefix("x") {
				// Hex
				value = occurrence.stringByDeletingPrefix("x").hexValue
			} else {
				value = occurrence.integerValue
			}
			
			string = string.stringByReplacingOccurrencesOfString("&#\(occurrence);", withString: String(Character(UnicodeScalar(value))))
		}
		
		return string
	}
	
	/// Returns if the receiver is equal to the other string in a case
	/// insensitive manner.
	public func isCaseInsensitivelyEqualToString(string: String) -> Bool {
		return self.compare(string, options: .CaseInsensitiveSearch) == .OrderedSame
	}
	
	/// Creates self from a base64 encoded string.
	public init?(base64EncodedString: String) {
		guard let data = NSData(base64EncodedString: base64EncodedString, options: NSDataBase64DecodingOptions()) else {
			return nil
		}
		
		self.init(data: data)
	}
	
	/// This tries to create a string from data. First, UTF8 is tried as encoding,
	/// then ASCII and then it just goes through the list of available string
	/// encodings. This is pretty much a convenience initializer for cases where
	/// you don't know the source encoding, but want to get a non-nil string
	/// for as many cases as possible.
	public init?(data: NSData!) {
		if data == nil {
			return nil
		}

		// First, try UTF8, then ASCII.
		for enc in [NSUTF8StringEncoding, NSASCIIStringEncoding] {
			if let str = String(data: data, encoding: enc) {
				self = str
				return
			}
		}

		var encodings = NSString.availableStringEncodings()
		while encodings.memory != 0 {
			let enc = encodings.memory as NSStringEncoding
			if let str = String(data: data, encoding: enc) {
				self = str
				return
			}

			encodings = encodings.successor()
		}

		return nil
	}

	/// Replaces \r, \n, \t, \u3245, etc.
	public var JSDecodedString: String {
		var result = self
		result = result.stringByReplacingOccurrencesOfString("\\r", withString: String(Character(UnicodeScalar(13))))
		result = result.stringByReplacingOccurrencesOfString("\\n", withString: String(Character(UnicodeScalar(10))))
		result = result.stringByReplacingOccurrencesOfString("\\t", withString: String(Character(UnicodeScalar(9))))

		var i: String.Index = self.startIndex
		while i < self.characters.endIndex {
			let c = self.characters[i]
			if c == Character("\\") && i < self.endIndex.advancedBy(-1) {
				let nextC = self.characters[i.successor()]
				if nextC == Character("u") && i < self.endIndex.advancedBy(-6) {
					let unicodeCharCode = self.substringWithRange(i.advancedBy(2) ..< i.advancedBy(6))
					let replacementChar = unicodeCharCode.hexValue
					
					result = result.stringByReplacingOccurrencesOfString("\\u\(unicodeCharCode)", withString: String(Character(UnicodeScalar(replacementChar))))
					i = i.advancedBy(6)
					continue
				}
			}
			
			i = i.successor()
		}
		return result
	}

	/// Returns the last character or \0 if the string is empty.
	public var lastCharacter: Character {
		return self.characters.last ?? Character(UInt8(0))
	}
	
	/// Splits `self` using NSCharacterSet.newlineCharacterSet().
	public var lines: [String] {
		return self.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
	}

	/// Computes MD5 digest of self
	public var MD5Digest: String {
		guard let data = self.dataUsingEncoding(NSUTF8StringEncoding) else {
			fatalError("Can't represent string as UTF8 - \(self).")
		}
		
		return data.MD5Digest
	}
	
	/// Truncates the string in the middle with '...' in order to fit the width, 
	/// similarily as NSTextField does.
	public func middleTruncatedStringToFitWidth(width: CGFloat, withAttributes atts: [String: AnyObject]) -> String {
		var front = ""
		var tail = ""
		
		var frontIndex = self.startIndex.advancedBy(self.characters.count / 2)
		var tailIndex = frontIndex
		
		var result = self
		var size = result.sizeWithAttributes(atts)
		while size.width > width {
			frontIndex = frontIndex.predecessor()
			tailIndex = tailIndex.successor()
			
			front = self.substringToIndex(frontIndex)
			tail = self.substringFromIndex(tailIndex)
			result = "\(front)...\(tail)"
			size = result.sizeWithAttributes(atts)
		}
		return result
	}
	
	public mutating func prepend(string: String) {
		self.insertContentsOf(string.characters, at: self.startIndex)
	}

	/// Returns a reverse string.
	public var reverseString: String {
		return String(self.characters.reverse())
	}
	
	/// Returns second character, or \0 is the string has only one character (or
	/// is empty).
	public var secondCharacter: Character {
		if self.characters.count < 2 {
			return Character(UInt8(0))
		}
		
		return self.characters[self.startIndex.advancedBy(1)]
	}
	
	/// Returns size with attributes, limited to width.
	public func sizeWithAttributes(attrs: [String : AnyObject], maxWidth width: CGFloat) -> CGSize {
		let constraintSize = CGSize(width: width, height: CGFloat.max)
		#if os(iOS)
			return self.boundingRectWithSize(constraintSize, options: .UsesLineFragmentOrigin, attributes: attrs, context: nil).size
		#else
			return self.boundingRectWithSize(constraintSize, options: .UsesLineFragmentOrigin, attributes: attrs).size
		#endif
	}

	/// Capitalizes the first letter of the string.
	public var stringByCapitalizingFirstLetter: String {
		if self.characters.count == 0 {
			return self
		}

		let index = self.startIndex.advancedBy(1)
		let firstLetter = self.substringToIndex(index)
		let restOfString = self.substringFromIndex(index)
		return firstLetter.uppercaseString + restOfString
	}

	public var stringByDeletingLastCharacter: String {
		if self.isEmpty {
			fatalError("Cannot delete last character from an empty string!")
		}

		return self.substringToIndex(self.endIndex.predecessor())
	}

	/// Removes the prefix from the string.
	public func stringByDeletingPrefix(prefix: String) -> String {
		if !self.hasPrefix(prefix) {
			return self
		}

		return self.substringFromIndex(self.startIndex.advancedBy(prefix.characters.count))
	}

	/// Removes the suffix from the string.
	public func stringByDeletingSuffix(suffix: String) -> String {
		if !self.hasSuffix(suffix) {
			return self
		}

		let len = suffix.characters.count
		return self.substringToIndex(self.endIndex.advancedBy(-len))
	}

	/// Encodes string by adding percent escapes. Unlike
	/// stringByAddingPercentEncodingWithAllowedCharacters(...), this never
	/// returns nil, but instead falls back to self.
	public var stringByEncodingIllegalURLCharacters: String {
		return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet()) ?? self
	}

	/// Lowercases the first letter of the string.
	public var stringByLowercasingFirstLetter: String {
		if self.characters.count == 0 {
			return self
		}

		let index = self.startIndex.advancedBy(1)
		let firstLetter = self.substringToIndex(index)
		let restOfString = self.substringFromIndex(index)
		return firstLetter.lowercaseString + restOfString
	}

	/// Trims the string to maximum length of maxLen, trimming the middle.
	public func stringByMiddleTrimmingToMaximumLengthOf(maxLen: Int) -> String {
		if self.characters.count < maxLen {
			return self
		}

		let begin = self.substringToIndex(self.startIndex.advancedBy((maxLen - 1) / 2))
		let end = self.substringFromIndex(self.endIndex.advancedBy(-1 * (maxLen - 1) / 2))
		return begin + "…" + end
	}

	/// Prepends prefix enough times so that it has the specific length.
	public func stringByPaddingFrontToLength(length: Int, withString padString: String) -> String {
		var str = self
		while str.characters.count + padString.characters.count < length {
			str = padString + str
		}
		return str
	}
	
	/// Removes characters from the set from the beginning of the string.
	public func stringByTrimmingLeftCharactersInSet(set: NSCharacterSet) -> String {
		var index = 0
		while index < self.characters.count && self.characters[self.startIndex.advancedBy(index)].isMemberOfCharacterSet(set) {
			index += 1
		}
		
		return self.substringFromIndex(self.startIndex.advancedBy(index))
	}
	
	/// Removes characters from the set from the end of the string.
	public func stringByTrimmingRightCharactersInSet(set: NSCharacterSet) -> String {
		var index = self.characters.count - 1
		while index >= 0 && self.characters[self.startIndex.advancedBy(index)].isMemberOfCharacterSet(set) {
			index -= 1
		}
		
		index += 1
		
		return self.substringToIndex(self.startIndex.advancedBy(index))
	}

	/// Trims whitespace whitespace and newlines.
	public var stringByTrimmingWhitespace: String {
		return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
	}
	
	/// Returns the suffix of length. Doesn't do any range checking.
	public func suffixOfLength(length: Int) -> String {
		return self.substringFromIndex(self.endIndex.advancedBy(-1 * length))
	}

	/// This method decodes the string as a URL query. E.g. arg1=val1&arg2=val2
	/// will become [ "arg1": "val1", ... ]. This is the opposite of URLQueryString()
	/// method on Dictionary
	public var URLQueryDictionary: [String: String] {
		let variablePairs = self.allVariablePairsForRegexString("&?(?P<VARNAME>[^=]+)=(?P<VARVALUE>[^&]+)")
		var dict: [String: String] = [:]
		for (key, value) in variablePairs {
			guard let
			decodedKey = key.stringByRemovingPercentEncoding,
				decodedValue = value.stringByRemovingPercentEncoding else {
					dict[key] = value
					continue
			}

			dict[decodedKey] = decodedValue
		}
		return dict
	}
	
	/// Tries several heuristics to see if the email address is valid, or even 
	/// phony.
	public func validateEmailAddress() -> XUEmailValidationFormat {
		// First see if it fits the general description
		let regex = XURegex(pattern: "^[\\w\\.-]{2,}@[\\w\\.-]{2,}\\.\\w{2,}$", andOptions: .Caseless)
		if !regex.matchesString(self) {
			return .Wrong
		}
		
		// It's about right, see for some obviously phony emails
		if self.hasCaseInsensitiveSubstring("fuck") || self.hasCaseInsensitiveSubstring("shit")
			|| self.hasCaseInsensitiveSubstring("qwert") || self.hasCaseInsensitiveSubstring("asdf")
			|| self.hasCaseInsensitiveSubstring("mail@mail.com") || self.hasCaseInsensitiveSubstring("1234") {
			return .Phony
		}
		
		return .Correct
	}
	
}

/// Numeric methods
public extension String {

	/// This will return double value of the string, kind of like NSString in ObjC;
	/// if the string cannot be parsed, 0.0 is returned.
	public var doubleValue: Double {
		let doubleValue = Double(self)
		if doubleValue != nil {
			return doubleValue!
		}

		let charSet = NSCharacterSet(charactersInString: "0123456789.")
		var numberString = ""
		var wasDot = false
		for char in self.characters {
			if char == "." {
				if wasDot {
					break // Second dot
				} else {
					wasDot = true
				}
			}

			if char.isMemberOfCharacterSet(charSet) {
				numberString.append(char)
			} else {
				break
			}
		}

		return Double(numberString) ?? 0.0
	}

	/// This will return integer value of the string, kind of like NSString in ObjC;
	/// if the string cannot be parsed, 0 is returned.
	public var integerValue: Int {
		if let intValue = Int(self) {
			return intValue
		}

		let charSet = NSCharacterSet(charactersInString: "0123456789")
		var numberString = ""
		for char in self.characters {
			if char.isMemberOfCharacterSet(charSet) {
				numberString.append(char)
			} else {
				break
			}
		}

		return Int(numberString) ?? 0
	}
}
