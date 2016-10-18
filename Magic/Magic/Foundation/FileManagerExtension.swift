//
//  FileManagerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension FileManager {
    class func getDocumentPath(fileName: String) -> String {
        return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!)
            .appendingPathComponent(fileName)
            .path
    }
    
    class func documentPaths(filter: ((URL) -> Bool)? = nil) -> [String] {
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
        
        return directoryUrls.map {
            $0.path
        }
    }
    
    // Byte
    func fileSize(at path: String) -> Int {
        let attributes = try? FileManager.default.attributesOfItem(atPath: path)
        
        if let dict = attributes {
            return dict[FileAttributeKey.systemSize] as? Int ?? 0
        }
        
        return 0
    }
    
    /**
     Get URL of Document directory.
     
     - returns: Document directory URL.
     */
    class func documentURL() -> URL? {
        return URLForDirectory(.documentDirectory)
    }
    
    /**
     Get String of Document directory.
     
     - returns: Document directory String.
     */
    class func documentPath() -> String? {
        return pathForDirectory(.documentDirectory)
    }
    
    /**
     Get URL of Library directory
     
     - returns: Library directory URL
     */
    class func libraryURL() -> URL? {
        return URLForDirectory(.libraryDirectory)
    }
    
    /**
     Get String of Library directory
     
     - returns: Library directory String
     */
    class func libraryPath() -> String? {
        return pathForDirectory(.libraryDirectory)
    }
    
    /**
     Get URL of Caches directory
     
     - returns: Caches directory URL
     */
    class func cachesURL() -> URL? {
        return URLForDirectory(.cachesDirectory)
    }
    
    /**
     Get String of Caches directory
     
     - returns: Caches directory String
     */
    class func cachesPath() -> String? {
        return pathForDirectory(.cachesDirectory)
    }
    
    fileprivate class func URLForDirectory(_ directory: FileManager.SearchPathDirectory) -> URL? {
        return `default`.urls(for: directory, in: .userDomainMask).last
    }
    
    fileprivate class func pathForDirectory(_ directory: FileManager.SearchPathDirectory) -> String? {
        return NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true)[0]
    }
}
