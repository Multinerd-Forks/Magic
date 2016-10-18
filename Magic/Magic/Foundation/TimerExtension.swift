//
//  TimerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension Timer {
    
    @discardableResult
    class func every(seconds interval: TimeInterval, handler: @escaping () -> Void) -> Timer {
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval, interval, 0, 0) { _ in
            handler()
        }
        return timer!
    }
    
    @discardableResult
    class func after(seconds interval: TimeInterval, queue: DispatchQueue = .global(qos: .background), handler: @escaping () -> Void) -> Timer {
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval, 0, 0, 0) { _ in
            handler()
        }
        return timer!
    }

    private class ActionStorage {
        var timer: Timer!
        var action: ((Timer) -> Void)!
        
        @objc func triggerAction() {
            action(timer)
        }
    }
    
    convenience init(timeInterval: TimeInterval, userInfo: Any? = nil, repeats: Bool = false, action: @escaping (Timer) -> ()) {
        let actionStorage = ActionStorage()
        
        self.init(timeInterval: timeInterval, target: actionStorage, selector: #selector(ActionStorage.triggerAction), userInfo: userInfo, repeats: repeats)
        actionStorage.timer = self
        actionStorage.action = action
    }
    
    class func schedule(timeInterval: TimeInterval, userInfo: Any? = nil, repeats: Bool = false, action: @escaping (Timer) -> ()) -> Timer {
        let actionStorage = ActionStorage()
        
        let timer = Timer(timeInterval: timeInterval, target: actionStorage, selector: #selector(ActionStorage.triggerAction), userInfo: userInfo, repeats: repeats)
        actionStorage.timer = timer
        actionStorage.action = action
        RunLoop.current.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
        return timer
    }
}
