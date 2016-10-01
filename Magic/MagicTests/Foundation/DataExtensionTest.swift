//
//  DataExtensionTest.swift
//  Magic
//
//  Created by Broccoli on 2016/9/30.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import XCTest

class DataExtensionTest: XCTestCase {

    func testStringValue() {
        let testData = "broccoli".data(using: .utf8)
        XCTAssertEqual(testData!.string!, "broccoli")
    }    
}
