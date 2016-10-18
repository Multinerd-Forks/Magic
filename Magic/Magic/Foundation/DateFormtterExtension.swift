//
//  DateFormtterExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension DateFormatter {
    
    public convenience init(dateFormat: String) {
        self.init()
        
        self.dateFormat = dateFormat
    }
}

