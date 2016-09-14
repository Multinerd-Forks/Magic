
//
//  NSString_extension.swift
//  Extension
//
//  Created by Broccoli on 16/9/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// property
extension String {
    public var JSONValue: AnyObject? {
        guard let data = dataUsingEncoding(NSUTF8StringEncoding) else {
            return nil
        }
        
        do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves)
        } catch {
            return nil
        }
    }
    
    public var base64: String? {
        let data = dataUsingEncoding(NSUTF8StringEncoding)
        let base64String = data?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        return base64String
    }
    
    public var lenght: NSInteger {
        return lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
    }
}

extension String {
    // 手机号码验证
    public func isValidMobilePhone() -> Bool {
        let regular = "^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluateWithObject(self)
    }
    
    // 邮箱
    public func isValidEmail() -> Bool {
        let regular = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluateWithObject(self)
    }
    
    // 身份证号
    public func isValidIdentityCard() -> Bool {
        let regular = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluateWithObject(self)
    }
    
    // 从身份证上判断性别
    public func sexInfo() -> Bool {
        var sexNum = 0
        if lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 15 {
            let range = Range(startIndex.advancedBy(14)..<startIndex.advancedBy(15))
            sexNum = Int(substringWithRange(range))!
        } else if lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 18 {
            let range = Range(startIndex.advancedBy(16)..<startIndex.advancedBy(17))
            sexNum = Int(substringWithRange(range))!
        }
    
        return sexNum % 2 == 0 ? false : true
    }
    
    // 转时间
    public func toDate(dateFormat: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.dateFromString(self)
    }
    
    // TODO: 写成属性
    public func capitalizedString() -> String {
        if lengthOfBytesUsingEncoding(NSUTF8StringEncoding) <= 1 {
            return self.uppercaseString
        }
        
        let firstChar = substringToIndex(startIndex.advancedBy(1)).uppercaseString
        let otherChar = substringFromIndex(startIndex.advancedBy(1)).lowercaseString
        return firstChar + otherChar
    }
}

// TODO: subscript
extension String {
    subscript(range: Range<Int>) -> String {
        let startIndex = self.startIndex.advancedBy(range.startIndex)
        let endIndex = self.startIndex.advancedBy(range.endIndex)
        
        return self.substringWithRange(Range<String.Index>(startIndex..<endIndex))
    }
}

