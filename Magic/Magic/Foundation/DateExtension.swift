//
//  DateExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// init
public extension Date {
    public init?(from dateString: String, dateFormat: String = "yyyy/MM/dd HH:mm") {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        guard let date = formatter.date(from: dateString), !dateString.isEmpty else {
            return nil
        }
        
        self.init(timeInterval: 0, since: date)
    }
}

// property
public extension Date {
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
    
    var isToday: Bool {
        return Calendar.autoupdatingCurrent.isDateInToday(self)
    }

     var isTomorrow: Bool {
        return Calendar.autoupdatingCurrent.isDateInTomorrow(self)
    }

     var isYesterday: Bool {
        return Calendar.autoupdatingCurrent.isDateInYesterday(self)
    }
    
     var isPast: Bool {
        return compare(Date()) == .orderedAscending
    }
    
    var isFuture: Bool {
        return !isPast
    }
}

// function
public extension Date {
    func string(format dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
    func toLocalTime() -> Date {
        let seconds = NSTimeZone.default.secondsFromGMT(for: self)
        return Date(timeInterval: TimeInterval(seconds), since: self)
    }
    
    func toUTCTime() -> Date {
        let seconds = -NSTimeZone.default.secondsFromGMT(for: self)
        return Date(timeInterval: TimeInterval(seconds), since: self)
    }
}
