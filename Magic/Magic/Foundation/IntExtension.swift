//
//  IntExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/18.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension Int {
    
    var isEven:Bool     {return (self % 2 == 0)}
    var isOdd:Bool      {return (self % 2 != 0)}
    var isPositive:Bool {return (self >= 0)}
    var isNegative:Bool {return (self < 0)}
    
    func toDouble() -> Double {
        return Double(self)
    }
    func toFloat() -> Float {
        return Float(self)
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

