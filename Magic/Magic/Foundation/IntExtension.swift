//
//  IntExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/18.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension Int {
    func toBool () -> Bool? {
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
    
    func times(in thread: DispatchQueue = DispatchQueue.global(qos: .background), handler: @escaping (Int) -> ()) {
        (0..<self).forEach {_ in
            handler(self)
        }
    }
    
    func delay(in thread: DispatchQueue = DispatchQueue.global(qos: .background), handler: @escaping (Int) -> ()) {
        let deadlineTime = DispatchTime.now() + .seconds(self)
        thread.asyncAfter(deadline: deadlineTime) {
           handler(self)
        }
    }
}

