//
//  SequenceExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/9.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension Sequence {
    func all(check: (Iterator.Element) -> Bool) -> Bool {
        for element in self {
            guard check(element) else {
                return false
            }
        }
        return true
    }
}
