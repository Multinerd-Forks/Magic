//
//  DispatchQueueExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/8.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    
    private static var identifierTracker = [String]()
    
    public class func once(identifier: String, _ block: () -> Void) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        
        if identifierTracker.contains(identifier) {
            return
        }
        
        identifierTracker.append(identifier)
        block()
    }
}

