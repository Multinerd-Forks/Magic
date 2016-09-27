//
//  NSObjectExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/13.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// function
public extension NSObject {
    func setAssociatedObject(_ value: AnyObject?, associativeKey: UnsafeRawPointer, policy: objc_AssociationPolicy) {
        if let valueAsAnyObject = value {
            objc_setAssociatedObject(self, associativeKey, valueAsAnyObject, policy)
        }
    }
    
    func getAssociatedObject<T>(_ associativeKey: UnsafeRawPointer) -> T? {
        if let valueAsType = objc_getAssociatedObject(self, associativeKey) as? T {
            return valueAsType
        } else {
            return nil
        }
    }
}
