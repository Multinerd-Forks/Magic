//
//  RangeExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/13.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Methods
public extension CountableClosedRange {
    func each(callback: (Element) -> (Void)) {
        for index in self {
            callback(index)
        }
    }
    
    func each(callback: @escaping (Void) -> (Void)) {
        for _ in self {
            callback()
        }
    }
    
}

func ==<T: Comparable>(left: Range<T>, right: Range<T>) -> Bool {
    return left.lowerBound == right.lowerBound && left.upperBound == right.upperBound
}
