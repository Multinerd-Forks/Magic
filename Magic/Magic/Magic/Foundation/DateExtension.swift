//
//  DateExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// init
extension Date {
    public init?(from dateString: String, dateFormat: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        if let date = formatter.date(from: dateString) {
            self.init(timeInterval: 0, since: date)
        } else {
            self.init()
            return nil
        }
    }
}

// property
extension Date {
    var year: Int {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.component(.year, from: self)
    }
    
    var month: Int {
        let gregorian = Calendar(identifier: .gregorian)
        return gregorian.component(.month, from: self)
    }
    
    var day: Int {
        let gregorian = Calendar(identifier: .gregorian)
        return gregorian.component(.day, from: self)
    }
    
    var hour: Int {
        let gregorian = Calendar(identifier: .gregorian)
        return gregorian.component(.hour, from: self)
    }
    
    var minute: Int {
        let gregorian = Calendar(identifier: .gregorian)
        return gregorian.component(.minute, from: self)
    }
    
    var second: Int {
        let gregorian = Calendar(identifier: .gregorian)
        return gregorian.component(.second, from: self)
    }
    
    var timeStamp: Double {
        return timeIntervalSince1970
    }
}

// function
extension Date {
    func string(format dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
    func toLocalTime() -> Date {
        let tz = NSTimeZone.default
        let seconds = tz.secondsFromGMT(for: self)
        return Date(timeInterval: TimeInterval(seconds), since: self)
    }
    
    func toUTCTime() -> Date {
        let tz = NSTimeZone.default
        let seconds = -tz.secondsFromGMT(for: self)
        return Date(timeInterval: TimeInterval(seconds), since: self)
    }
}
