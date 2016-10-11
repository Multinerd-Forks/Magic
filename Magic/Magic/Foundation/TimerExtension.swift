//
//  TimerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension Timer {
    public static func every(seconds: TimeInterval, handler: @escaping (CFRunLoopTimer?) -> Void) -> Timer {
        let fireDate = CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, seconds, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, .commonModes)
        return timer!
    }
    
    public static func delay(seconds: Double, queue: DispatchQueue = .global(qos: .background), after: @escaping ()->()) {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        queue.asyncAfter(deadline: time, execute: after)
    }
}
