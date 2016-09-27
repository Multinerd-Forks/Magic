//
//  With.swift
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
