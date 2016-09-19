//
//  StringExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// property
extension String {
    public var JSONValue: Any? {
        guard let data = data(using: String.Encoding.utf8) else {
            return nil
        }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    public var base64: String? {
        let data = self.data(using: String.Encoding.utf8)
        let base64String = data?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return base64String
    }
    
    public var lenght: NSInteger {
        return lengthOfBytes(using: String.Encoding.utf8)
    }
}

// function
public extension String {
    
    func isValidMobilePhone() -> Bool {
        let regular = "^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let regular = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluate(with: self)
    }
    
    func isValidIdentityCard() -> Bool {
        let regular = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluate(with: self)
    }
    
    func sexInfo() -> Bool {
        var sexNum = 0
        if lengthOfBytes(using: String.Encoding.utf8) == 15 {
            let range = Range(characters.index(startIndex, offsetBy: 14)..<characters.index(startIndex, offsetBy: 15))
            sexNum = Int(substring(with: range))!
        } else if lengthOfBytes(using: String.Encoding.utf8) == 18 {
            let range = Range(characters.index(startIndex, offsetBy: 16)..<characters.index(startIndex, offsetBy: 17))
            sexNum = Int(substring(with: range))!
        }
    
        return sexNum % 2 == 0 ? false : true
    }
    
    func capitalizedString() -> String {
        if lengthOfBytes(using: String.Encoding.utf8) <= 1 {
            return self.uppercased()
        }
        
        let firstChar = substring(to: characters.index(startIndex, offsetBy: 1)).uppercased()
        let otherChar = substring(from: characters.index(startIndex, offsetBy: 1)).lowercased()
        return firstChar + otherChar
    }
    
    func insert(_ string: String, to index: Int) -> String {
        return  String(characters.prefix(index)) + string + String(characters.suffix(characters.count-index))
    }
    
    func toDate(dateFormat: String = "yyyy-MM-dd hh-mm-ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self)
    }
    
    func toDouble() -> Double? {
       return NumberFormatter().number(from: self)?.doubleValue
    }
    
    func toFloat() -> Float? {
//        return NumberFormatter().number(from: self)?.floatValue
        return Float(self)
    }
    
    func toUInt() -> UInt? {
       return NumberFormatter().number(from: self)?.uintValue
    }
    
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    // 下划线 NSAttributedString
}

// TODO: subscript
extension String {
    subscript(range: Range<Int>) -> String {
        get {
            let startIndex = self.characters.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.characters.index(self.startIndex, offsetBy: range.upperBound)
            
            return substring(with: Range<String.Index>(startIndex..<endIndex))
        }
        
        set {
            let startIndex = self.characters.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.characters.index(self.startIndex, offsetBy: range.upperBound)
            replaceSubrange(Range<String.Index>(startIndex..<endIndex), with: newValue)
        }
    }
}

