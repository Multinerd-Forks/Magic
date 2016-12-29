//
//  BoolExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Properties
public extension Bool {
    
    /// Return 1 if true, or 0 if false.
    public var intValue: Int {
        return self ? 1 : 0
    }
    
    /// Return "true" if true, or "false" if false.
    public var stringValue: String {
        return description
    }
    
    /// Return inversed value of bool.
    public var toggled: Bool {
        return !self
    }
}

// MARK: - Methods
public extension Bool {
    
    /// Toggle value for bool.
    ///
    /// - Returns: inversed value of bool.
    @discardableResult public mutating func toggle() -> Bool {
        self = !self
        return self
    }
}

