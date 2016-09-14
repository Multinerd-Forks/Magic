//
//  NSObject_extension.swift
//  Magic
//
//  Created by Broccoli on 16/9/13.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation
import ObjectiveC

extension NSObject {
    public func setAssociatedObject<T>(value: T, associativeKey: UnsafePointer<Void>, policy: objc_AssociationPolicy) {
        if let valueAsAnyObject = value as? AnyObject {
            objc_setAssociatedObject(self, associativeKey, valueAsAnyObject, policy)
        }
    }
    
    public func getAssociatedObject<T>(associativeKey: UnsafePointer<Void>) -> T? {
        if let valueAsType = objc_getAssociatedObject(self, associativeKey) as? T {
            return valueAsType
        } else {
            return nil
        }
    }

}