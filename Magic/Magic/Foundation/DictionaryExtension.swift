//
//  DictionaryExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// property
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
        return reduce([Any]()) {
            [$0.1.0] + $0.0
        }
    }
    
    var allValues: [Any] {
        return reduce([Any]()) {
            [$0.1.1] + $0.0
        }
    }
}

public extension Dictionary {
    mutating func merged<K, V>(_ dictionaries: Dictionary<K, V>...) {
        dictionaries.forEach {
            $0.forEach {
                updateValue($0.1 as! Value, forKey: $0.0 as! Key)
            }
        }
    }
    
    func merge<K, V>(_ dictionaries: Dictionary<K, V>...) -> Dictionary {
        var mergedDictionary = self
        dictionaries.forEach {
            $0.forEach {
                mergedDictionary.updateValue($0.1 as! Value, forKey: $0.0 as! Key)
            }
        }
        return mergedDictionary
    }
    
    func combine<K, V>(_ left: Dictionary<K, V>, right: Dictionary<K, V>) -> Dictionary<K, V> {
        var map = Dictionary<K, V>()
        for (k, v) in left {
            map[k] = v
        }
        for (k, v) in right {
            map[k] = v
        }
        return map
    }
    
    mutating func removedNulls() {
        let keys = Array(self.keys)
        let values = Array(self.values)
        var nullKeys = Array<Key>()
        keys.enumerated().forEach { index, key in
            
            var value = values[index]
            
            if !(value is NSNull) {
                if var v = value as? Dictionary, let val = v.removedNulls() as? Value  {
                    value = val
                }
                nullKeys.append(key)
            }
        }
        nullKeys.forEach {
            self.removeValue(forKey: $0)
        }
    }
    
    func removeNulls() -> Dictionary {
        let keys = Array(self.keys)
        let values = Array(self.values)
        var dictionary = Dictionary()
        
        keys.enumerated().forEach { index, key in
            
            var value = values[index]
            
            if !(value is NSNull) {
                if let v = value as? Dictionary, let val = v.removeNulls() as? Value  {
                    value = val
                }
                dictionary[key] = value
            }
        }
        return dictionary
    }
}

// http://stackoverflow.com/a/34527546/235334
func + <K,V>(left: Dictionary<K,V>, right: Dictionary<K,V>?) -> Dictionary<K,V> {
    guard let right = right else { return left }
    return left.reduce(right) {
        var new = $0 as [K:V]
        new.updateValue($1.1, forKey: $1.0)
        return new
    }
}

// http://stackoverflow.com/a/34527546/235334
func += <K,V>(left: inout Dictionary<K,V>, right: Dictionary<K,V>?) {
    guard let right = right else { return }
    right.forEach { key, value in
        left.updateValue(value, forKey: key)
    }
}

