//
//  StringExtensionTest.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import XCTest

class StringExtensionTest: XCTestCase {
    
    func testJSONValue() {
        let testData = "[1, 2, 3, 4]"
        let jsonValue = testData.JSONValue as! [Int]
        
        XCTAssertEqual(jsonValue, [1, 2, 3, 4])
    }
    
    func testBase64() {
        let testData = "Magic"
        let base64Value = testData.base64
        
        XCTAssertEqual(base64Value, "TWFnaWM=")
    }
    
    func testLenght() {
        let testData = "123456"
        let lenght = testData.lenght
        
        XCTAssertEqual(lenght, 6)
    }
    
    func testIsValidMobilePhone() {
        var testData = "15812344359"
        XCTAssertTrue(testData.isValidMobilePhone())
        testData = "158-1234-4359"
        XCTAssertFalse(testData.isValidMobilePhone())
        testData = "25812344359"
        XCTAssertFalse(testData.isValidMobilePhone())
        testData = "1581234435"
        XCTAssertFalse(testData.isValidMobilePhone())
        testData = "158123443523"
        XCTAssertFalse(testData.isValidMobilePhone())
    }
    
    func testIsValidEmail() {
        var testData = "test@test.com"
        XCTAssertTrue(testData.isValidEmail())
        testData = "test@test."
        XCTAssertFalse(testData.isValidEmail())
        testData = "test@test"
        XCTAssertFalse(testData.isValidEmail())
        testData = "test@"
        XCTAssertFalse(testData.isValidEmail())
        testData = "@test"
        XCTAssertFalse(testData.isValidEmail())
    }
    
    func testIsValidIdentityCard() {
        // TODO:
    }
    
    func testSexInfo() {
        // TODO:
    }
}
