//
//  NSCalendar_extension.swift
//  Magic
//
//  Created by Broccoli on 16/9/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension Calendar {
    public func dateByAddingSeconds(_ seconds: NSInteger, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.second = seconds
//        return self.date(byAdding: components, to: date, options: [])!
        return self.date(byAdding: components, to: date)
    }
    
    public func dateByAddingMinutes(_ minutes: NSInteger, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.minute = minutes
        return self.date(byAdding: components, to: date)
    }
    
    public func dateByAddingHours(_ hours: NSInteger, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.hour = hours
        return self.date(byAdding: components, to: date)!
    }
    
    public func dateByAddingDays(_ days: Int, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.day = days
        return self.date(byAdding: components, to: date)
    }
    
    public func dateByAddingMonths(_ months: Int, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.month = months
        return self.date(byAdding: components, to: date)
    }
    
    public func dateByAddingYears(_ years: Int, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.year = years
        return self.date(byAdding: components, to: date)
    }
}
