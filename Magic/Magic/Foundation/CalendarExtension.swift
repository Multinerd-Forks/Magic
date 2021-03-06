//
//  CalendarExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Methods
public extension Calendar {
    func date(byAddingSeconds seconds: Int, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.second = seconds

        return self.date(byAdding: components, to: date)
    }
    
    func date(byAddingMinutes minutes: Int, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.minute = minutes
        
        return self.date(byAdding: components, to: date)
    }
    
    func date(byAddingHours hours: Int, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.hour = hours
        
        return self.date(byAdding: components, to: date)!
    }
    
    func date(byAddingDays days: Int, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.day = days
        
        return self.date(byAdding: components, to: date)
    }
    
    func date(byAddingMonths months: Int, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.month = months
        
        return self.date(byAdding: components, to: date)
    }
    
    func date(byAddingYears years: Int, toDate date: Date) -> Date? {
        var components = DateComponents()
        components.year = years
        
        return self.date(byAdding: components, to: date)
    }
}
