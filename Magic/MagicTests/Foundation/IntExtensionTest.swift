//
//  IntExtensionTest.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import XCTest
import Magic
import Foundation

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
    
    func testDelay() {
        // TODO: wait async callback 
        let nowTime = Date().timeIntervalSince1970
        print("nowTime \(nowTime)")
        5.delay(in: DispatchQueue.main) {
            XCTAssertTrue(Thread.current.isMainThread)
            
            let delayTime = Date().timeIntervalSince1970
            print("delayTime \(delayTime)")
            XCTAssertEqual(nowTime + 5, delayTime)
        }
    }
}
