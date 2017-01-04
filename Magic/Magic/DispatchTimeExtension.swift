//
//  DispatchTimeExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/12/29.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - ExpressibleByIntegerLiteral
extension DispatchTime: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = DispatchTime.now() + .seconds(value)
    }
}

// MARK: - ExpressibleByFloatLiteral
extension DispatchTime: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = DispatchTime.now() + .milliseconds(Int(value * 1000))
    }
}
