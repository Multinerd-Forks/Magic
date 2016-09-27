//
//  DataExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/24.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension Data {
    
    /**
     Converts Data to a string, if possible
     
     - Returns: String?
     */
    var string: String? {
        return String(data: self, encoding: .utf8)
    }
}
