//
//  IntExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/18.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension Int {
    func toBool () -> Bool? {
        switch true {
        case self == 0:
            return false
        case self == 1:
            return true
        case self > 1:
            return true
        default:
            return nil
        }
    }
}
