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
    
    func testMerged() {
        var testData = ["name" : "broccoli"]
        let mergeData = ["girlfriend" : "kiamo"]
        testData.merged(mergeData)
        XCTAssertEqual(testData, ["name" : "broccoli", "girlfriend" : "kiamo"])
    }
    
    func testMerge() {
        let testData = ["name" : "broccoli"]
        let mergeData = ["girlfriend" : "kiamo"]
        let resulrData = testData.merge(mergeData)
        XCTAssertEqual(resulrData, ["name" : "broccoli", "girlfriend" : "kiamo"])
    }
    
    func testRemovedNulls() {
        let houseAddress: String? = nil
        var testData = ["name" : "broccoli", "house" : houseAddress]
        testData.removedNulls()
        XCTAssertNil(testData["house"])
    }
    
    func testRemoveNulls() {
        let houseAddress: String? = nil
        let testData = ["name" : "broccoli", "house" : houseAddress]
        let resultData = testData.removeNulls()
        XCTAssertNil(resultData["house"]!)
    }
    // TODO: test operator
}
