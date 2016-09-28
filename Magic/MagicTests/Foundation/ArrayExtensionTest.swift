//
//  ArrayExtensionTest.swift
//  Magic
//
//  Created by Broccoli on 2016/9/27.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import XCTest

class ArrayExtensionTest: XCTestCase {
    func testJSONString() {
        let testData = [1, 3, 5, 7]
        
        XCTAssertEqual(testData.JSONString, "[1,3,5,7]")
    }
}
