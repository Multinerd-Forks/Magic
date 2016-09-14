//
//  NSCalendar_extension.swift
//  Magic
//
//  Created by Broccoli on 16/9/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension NSCalendar {
    public func dateByAddingSeconds(seconds: NSInteger, toDate date: NSDate) -> NSDate {
        let components = NSDateComponents()
        components.second = seconds
        return dateByAddingComponents(components, toDate: date, options: [])!
    }
    
    public func dateByAddingMinutes(minutes: NSInteger, toDate date: NSDate) -> NSDate {
        let components = NSDateComponents()
        components.minute = minutes
        return dateByAddingComponents(components, toDate: date, options: [])!
    }
    
    public func dateByAddingHours(hours: NSInteger, toDate date: NSDate) -> NSDate {
        let components = NSDateComponents()
        components.hour = hours
        return dateByAddingComponents(components, toDate: date, options: [])!
    }
    
    public func dateByAddingDays(days: Int, toDate date: NSDate) -> NSDate {
        let components = NSDateComponents()
        components.day = days
        return dateByAddingComponents(components, toDate: date, options: [])!
    }
    
    public func dateByAddingMonths(months: Int, toDate date: NSDate) -> NSDate {
        let components = NSDateComponents()
        components.month = months
        return dateByAddingComponents(components, toDate: date, options: [])!
    }
    
    public func dateByAddingYears(years: Int, toDate date: NSDate) -> NSDate {
        let components = NSDateComponents()
        components.year = years
        return dateByAddingComponents(components, toDate: date, options: [])!
    }
}