//
//  DictionaryExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Properties
public extension Dictionary {
    
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


// MARK: - Methods
public extension Dictionary {
    
    /// JSON Data from dictionary.
    ///
    /// - Parameter prettify: set true to prettify data (default is false).
    /// - Returns: optional JSON Data (if applicable).
    public func jsonData(prettify: Bool = false) -> Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: options)
            return jsonData
        } catch {
            return nil
        }
    }
    
    /// JSON String from dictionary.
    ///
    /// - Parameter prettify: set true to prettify string (default is false).
    /// - Returns: optional JSON String (if applicable).
    public func jsonString(prettify: Bool = false) -> String? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: options)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
    
    /// Check if key exists in dictionary.
    ///
    /// - Parameter key: key to search for
    /// - Returns: true if key exists in dictionary.
    func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
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

