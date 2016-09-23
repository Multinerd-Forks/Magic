//
//  IntExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/18.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension Int {
    public func toBool () -> Bool? {
        switch true {
        case self == 0:
            return false
        case self == 1:
            return true
        case self > 0:
            return true
        case self < 0:
            return false
        default:
            return nil
        }
    }
    
    // Times
    
    public func delay(in thread: DispatchQueue = DispatchQueue.global(qos: .background), handler:@escaping () -> ()) {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        thread.asyncAfter(deadline: deadlineTime) {
           handler()
        }
    }
}

