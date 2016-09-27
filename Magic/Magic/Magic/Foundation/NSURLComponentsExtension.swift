//
//  NSURLComponentsExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension NSURLComponents {
    public func updateQueryParameter(key: String, value: String?) -> String {
       var queryItems: [URLQueryItem] = (self.queryItems ?? [])
        for (index, item) in queryItems.enumerated() {
            if item.name.lowercased() == key.lowercased() {
                if let v = value {
                    queryItems[index] = URLQueryItem(name: key, value: v)
                } else {
                    queryItems.remove(at: index)
                }
                self.queryItems = queryItems.count > 0
                    ? queryItems : nil
                return self.string!
            }
        }
    
        if let v = value {
            queryItems.append(URLQueryItem(name: key, value: v))
            self.queryItems = queryItems
            return self.string!
        }
        
        return ""
    }
    
    public func addOrUpdateQueryStringParameter(values: [String: String?]) -> String {
        var newUrl = self.string ?? ""
        
        for item in values {
            newUrl = updateQueryParameter(key: item.0, value: item.1)
        }
        
        return newUrl
    }
    
    public func removeQueryStringParameter(key: String) -> String {
        return updateQueryParameter(key: key, value: nil)
    }
    
}
