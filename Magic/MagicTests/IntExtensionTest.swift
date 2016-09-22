//
//  IntExtensionTest.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import XCTest
import Magic

class IntExtensionTest: XCTestCase {
    var testData = 1
    
    func testToBool() {
        var result = testData.toBool()
        XCTAssertEqual(result, true)
        
        result = 0.toBool()
        XCTAssertEqual(result, false)
        
        
        result = (-1).toBool()
        XCTAssertEqual(result, false)
    }
}
