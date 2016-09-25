//
//  CGRectExtensionTest.swift
//  Magic
//
//  Created by Broccoli on 2016/9/24.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import XCTest
import Magic

class CGRectExtensionTest: XCTestCase {
    func testCGRectExtension() {
        let rect = CGRect(x: 1, y: 2, width: 3, height: 4)
        
        XCTAssertEqual(rect.x, 1)
        XCTAssertEqual(rect.y, 2)
//        XCTAssertEqual(rect.width, 3)
//        XCTAssertEqual(rect.height, 4)
    }
}
