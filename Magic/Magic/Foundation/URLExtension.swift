//
//  URLExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/17.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Properties
public extension URL {
    var queryParameters: [String : String] {
        var results = [String : String]()
        let keyValues = self.query?.components(separatedBy: "&")
        keyValues?.forEach {
            let kv = $0.components(separatedBy: "=")
            if kv.count > 1 {
                results[kv[0]] = kv[1]
            }
        }
        return results
    }
}
