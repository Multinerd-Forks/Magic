//
//  FileManagerExtensionTest.swift
//  Magic
//
//  Created by Broccoli on 2016/9/29.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import XCTest
import Magic

class FileManagerExtensionTest: XCTestCase {
  
    func testGetDocumentPath() {
        print(FileManager.getDocumentPath(fileName: "someFileName"))
    }
    
    func testGetDocumentPaths() {
        print(FileManager.getDocumentPaths())
    }
}
