
//
//  NSString_extension.swift
//  Extension
//
//  Created by Broccoli on 16/9/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension String {
    // 手机号码验证
    func isValidMobilePhone() -> Bool {
        let regular = "^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluateWithObject(self)
    }
    
    // 邮箱
    func isValidEmail() -> Bool {
        let regular = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluateWithObject(self)
    }
    
    // 身份证号
    func isValidIdentityCard() -> Bool {
        let regular = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluateWithObject(self)
    }
    
    // 从身份证上判断性别
    func sexInfo() -> Bool {
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
}

// TODO: subscript
extension String {
    func substring(start s: Int, end e: Int? = nil) -> String {
        let start = s >= 0 ? self.startIndex : self.endIndex
        let startIndex = start.advancedBy(s)
        
        var end: String.Index
        var endIndex: String.Index
        if(e == nil){
            end = self.endIndex
            endIndex = self.endIndex
        } else {
            end = e >= 0 ? self.startIndex : self.endIndex
            endIndex = end.advancedBy(e!)
        }
        
        let range = Range<String.Index>(startIndex..<endIndex)
        return self.substringWithRange(range)
    }
}