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
    var JSONString: String? {
        do {
            let JSONData = try JSONSerialization.data(withJSONObject: self)
            return String(data: JSONData, encoding: .utf8)
        } catch let error {
            #if DEBUG
                print("Magic Error: -- \(error)")
            #endif
            return nil
        }
    }
}

// function
public extension Array {
    func contains<Element: Equatable>(_ element: Element) -> Bool {
        return self.filter {
            $0 as? Element == element
            }.count > 0
    }
    
    func indexOf<Element: Equatable>(item: Element) -> Int? {
        for (index, _) in enumerated() {
            if contains(item) {
                return index
            }
        }
        
        return nil
    }
    
    func indexOf(condition: (Element) -> Bool) -> Int? {
        for (index, element) in enumerated() {
            if condition(element) {
                return index
            }
        }
        
        return nil
    }
}
