//
//  Function.swift
//  Magic
//
//  Created by Broccoli on 2016/9/23.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

@discardableResult
func With<T>(item: T, update: (inout T) throws -> Void) rethrows -> T {
    var this = item
    try update(&this)
    return this
}

func methodSwizzling<T>(_ obecjt: T.Type,originalSelector: Selector, swizzledSelector: Selector) {
    let originalMethod = class_getInstanceMethod(T.self as! AnyClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(T.self as! AnyClass, swizzledSelector)
    
    let didAddMethod = class_addMethod(T.self as! AnyClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    
    if didAddMethod {
        class_replaceMethod(T.self as! AnyClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
