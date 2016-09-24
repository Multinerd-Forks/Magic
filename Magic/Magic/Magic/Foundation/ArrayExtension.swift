//
//  ArrayExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// property
public extension Array {
    // 能用泛型么 和 Dictionary 重复了
    public var JSONString: String? {
        do {
            let JSONData = try JSONSerialization.data(withJSONObject: self)
            return String(data: JSONData, encoding: .utf8)
        } catch let error {
            // TODO: Debug
            print(error)
            return nil
        }
    }
}

// function
public extension Array {
    public func contains<T:Equatable>(_ object: T) -> Bool {
        return self.filter( {$0 as? T == object} ).count > 0
    }
}
