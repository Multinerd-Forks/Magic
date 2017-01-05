//
//  ArrayExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Properties
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

// MARK: - Methods
public extension Array {
    func contains<Element: Equatable>(_ element: Element) -> Bool {
        return self.filter {
            $0 as? Element == element
            }.count > 0
    }
    
    func indexsOf<Element: Equatable>(_ item: Element) -> [Int] {
        var indexs = [Int]()
        for (index, _) in enumerated() {
            if contains(item) {
               indexs.append(index)
            }
        }
        
        return indexs
    }
    
    func indexsOf(_ condition: (Element) -> Bool) -> [Int] {
        var indexs = [Int]()
        for (index, element) in enumerated() {
            if condition(element) {
                indexs.append(index)
            }
        }
        
        return indexs
    }
    
    func any(_ condition: (Element) -> Bool) -> Bool {
        for element in self {
            if condition(element) {
                return true
            }
        }
        
        return false
    }
    
    func chunk(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize)
            .map { (startIndex) -> [Element] in
            let endIndex = (startIndex.advanced(by: chunkSize) > self.count) ? self.count-startIndex : chunkSize
            return Array(self[startIndex..<startIndex.advanced(by: endIndex)])
        }
    }    
}

public func ==<T: Equatable>(lhs: [T]?, rhs: [T]?) -> Bool {
    switch (lhs, rhs) {
    case (.some(let lhs), .some(let rhs)):
        return lhs == rhs
    case (.none, .none):
        return true
    default:
        return false
    }
}
