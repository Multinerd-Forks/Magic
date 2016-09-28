//
//  DictionaryExtensionTest.swift
//  Magic
//
//  Created by Broccoli on 2016/9/27.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import XCTest

class DictionaryExtensionTest: XCTestCase {
    func testJSONString() {
//        let testData: [String : Any] = ["name" : "broccoli", "age": 17]
//        XCTAssertEqual(testData.JSONString!, "{\"name\":\"broccoli\", \"age\":17}")
    }
    
    func testAllKeys() {
//        let testData: [String : Any] = ["name" : "broccoli", "age": 17]
//        XCTAssertEqual(testData.allKeys as! [String], ["name", "age"])
    }
    
    func testAllValues() {
        let testData: [String : Any] = ["name" : "broccoli", "age": 17]
        print(testData.allValues)
    }
}
