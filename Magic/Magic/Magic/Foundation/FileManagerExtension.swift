//
//  FileManagerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension FileManager {
    public class func getDocumentPath(fileName: String) -> String {
        return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!)
            .appendingPathComponent(fileName)
            .path
    }
    
    public class func getDocumentPaths(filter: ((URL) -> Bool)? = nil) -> [String] {
        let documanet = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        guard var directoryUrls = try? FileManager.default.contentsOfDirectory(
            at: documanet,
            includingPropertiesForKeys: nil,
            options: FileManager.DirectoryEnumerationOptions()) else {
                return [String]()
        }
        
        if let f = filter {
            directoryUrls = directoryUrls.filter(f)
        }
        
        return directoryUrls.map { $0.path }
    }
}
