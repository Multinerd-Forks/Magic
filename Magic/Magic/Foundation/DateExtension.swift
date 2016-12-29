//
//  DateExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Initializers
public extension Date {
    init?(from dateString: String, dateFormat: String = "yyyy-MM-dd HH:mm") {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        
        guard let date = formatter.date(from: dateString), !dateString.isEmpty else {
            return nil
        }
        
        self.init(timeInterval: 0, since: date)
    }
    
    /// Create date object from ISO8601 string.
    ///
    /// - Parameter ISO8601String: ISO8601 string of format (yyyy-MM-dd'T'HH:mm:ss.SSSZ).
    public init(ISO8601String: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        self = dateFormatter.date(from: ISO8601String) ?? Date()
    }
    
    /// Create new date object from UNIX timestamp
    ///
    /// - Parameter unixTimestamp: UNIX timestamp
    public init(UNIXTimestamp: Double) {
        self.init(timeIntervalSince1970: UNIXTimestamp)
    }
    
    /// Create a new date form calendar components.
    ///
    /// - Parameters:
    ///   - calendar: Calendar (default is current).
    ///   - timeZone: TimeZone (default is current).
    ///   - era: Era (default is current era).
    ///   - year: Year (default is current year).
    ///   - month: Month (default is current month).
    ///   - day: Day (default is today).
    ///   - hour: Hour (default is current hour).
    ///   - minute: Minute (default is current minute).
    ///   - second: Second (default is current second).
    ///   - nanosecond: Nanosecond (default is current nanosecond).
    fileprivate init(
        calendar: Calendar? = Calendar.current,
        timeZone: TimeZone? = TimeZone.current,
        era: Int? = Date().era,
        year: Int? = Date().year,
        month: Int? = Date().month,
        day: Int? = Date().day,
        hour: Int? = Date().hour,
        minute: Int? = Date().minute,
        second: Int? = Date().second,
        nanosecond: Int? = Date().nanosecond) {
        
        var components = DateComponents()
        components.calendar = calendar
        components.timeZone = timeZone
        components.era = era
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        components.nanosecond = nanosecond
        
        self = calendar?.date(from: components) ?? Date()
    }
}

// MARK: - Properties
public extension Date {
    
    /// User’s current calendar.
    var calendar: Calendar {
        return Calendar.current
    }
    
    /// Era
    var era: Int {
        return calendar.component(.era, from: self)
    }
    
    /// Time zone used by system
    var timeZone: TimeZone {
        return calendar.timeZone
    }
    
    /// Quarter
    public var quarter: Int {
        return calendar.component(.quarter, from: self)
    }
    
    /// Year
    var year: Int {
        get {
            return calendar.component(.year, from: self)
        }
        set {
            self = Date(calendar: calendar,
                        timeZone: timeZone,
                        era: era,
                        year: newValue,
                        month: month,
                        day: day,
                        hour: hour,
                        minute: minute,
                        second: second,
                        nanosecond: nanosecond)
        }
    }
    
    
    /// Month
    var month: Int {
        get {
            return calendar.component(.month, from: self)
        }
        set {
            self = Date(calendar: calendar,
                        timeZone: timeZone,
                        era: era,
                        year: year,
                        month: newValue,
                        day: day,
                        hour: hour,
                        minute: minute,
                        second: second,
                        nanosecond: nanosecond)
        }
    }
    
    /// Day
    var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            self = Date(calendar: calendar,
                        timeZone: timeZone,
                        era: era,
                        year: year,
                        month: month,
                        day: newValue,
                        hour: hour,
                        minute: minute,
                        second: second,
                        nanosecond: nanosecond)
        }
    }
    
    /// Hour
    var hour: Int {
        get {
            return calendar.component(.hour, from: self)
        }
        set {
            self = Date(calendar: calendar,
                        timeZone: timeZone,
                        era: era,
                        year: year,
                        month: month,
                        day: day,
                        hour: newValue,
                        minute: minute,
                        second: second,
                        nanosecond: nanosecond)
        }
    }
    
    /// Minute
    var minute: Int {
        get {
            return calendar.component(.minute, from: self)
        }
        set {
            self = Date(calendar: calendar,
                        timeZone: timeZone,
                        era: era,
                        year: year,
                        month: month,
                        day: day,
                        hour: hour,
                        minute: newValue,
                        second: second,
                        nanosecond: nanosecond)
        }
    }
    
    // Second
    var second: Int {
        get {
            return calendar.component(.second, from: self)
        }
        set {
            self = Date(calendar: calendar,
                        timeZone: timeZone,
                        era: era,
                        year: year,
                        month: month,
                        day: day,
                        hour: hour,
                        minute: minute,
                        second: newValue,
                        nanosecond: nanosecond)
        }
    }
    
    /// Nanoseconds
    var nanosecond: Int {
        get {
            return calendar.component(.nanosecond, from: self)
        }
        set {
            self = Date(calendar: calendar,
                        timeZone: timeZone,
                        era: era,
                        year: year,
                        month: month,
                        day: day,
                        hour: hour,
                        minute: minute,
                        second: second,
                        nanosecond: newValue)
        }
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

// MARK: - Methods
public extension Date {
    
    
    /// Date string from date
    ///
    /// - Parameter dateFormat: dateFormat default is "yyyy-MM-dd HH:mm:ss"
    /// - Returns: date string
    func string(from dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "zh_CN")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
    /// Date string from date
    ///
    /// - Parameter style: DateFormatter style (default is .medium)
    /// - Returns: date string
    func string(from style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = style
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

func <=(lhs: Date, rhs: Date) -> Bool {
    let res = lhs.compare(rhs)
    return res == .orderedAscending || res == .orderedSame
}
func >=(lhs: Date, rhs: Date) -> Bool {
    let res = lhs.compare(rhs)
    return res == .orderedDescending || res == .orderedSame
}
func >(lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == .orderedDescending
}
func <(lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == .orderedAscending
}
func ==(lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == .orderedSame
}
