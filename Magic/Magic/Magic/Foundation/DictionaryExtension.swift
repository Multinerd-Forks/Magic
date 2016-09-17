//
//  DictionaryExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// propertyr
extension Dictionary {
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

