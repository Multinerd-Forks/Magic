//
//  DictionaryExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// propertyr
public extension Dictionary {
    var JSONString: String? {
        do {
            let JSONData = try JSONSerialization.data(withJSONObject: self)
            return String(data: JSONData, encoding: .utf8)
        } catch let error {
            print(error)
            return nil
        }
    }
    
    var allKeys: [Any] {
        return reduce([Any](), {
            [$0.1.0] + $0.0
        })
    }
    
    var allValues: [Any] {
        return reduce([Any](), {
            [$0.1.1] + $0.0
        })
    }
}

public extension Dictionary {
    mutating func merge<K, V>(dictionaries: Dictionary<K, V>...) {
        dictionaries.forEach {
            $0.forEach {
                updateValue($0.1 as! Value, forKey: $0.0 as! Key)
            }
        }
    }
}

// http://stackoverflow.com/a/34527546/235334
public func + <K,V>(left: Dictionary<K,V>, right: Dictionary<K,V>?) -> Dictionary<K,V> {
    guard let right = right else { return left }
    return left.reduce(right) {
        var new = $0 as [K:V]
        new.updateValue($1.1, forKey: $1.0)
        return new
    }
}

// http://stackoverflow.com/a/34527546/235334
public func += <K,V>(left: inout Dictionary<K,V>, right: Dictionary<K,V>?) {
    guard let right = right else { return }
    right.forEach { key, value in
        left.updateValue(value, forKey: key)
    }
}

