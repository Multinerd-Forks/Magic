//
//  BundleExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/14.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Properties
extension Bundle {
    static var name: String? {
        if let bundleDisplayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return bundleDisplayName
        } else if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }
        
        return nil
    }
    
    static var appVersion: String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    static var build: String {
        return Bundle.main.object(forInfoDictionaryKey: String(kCFBundleVersionKey)) as! String
    }
    
    static var bundleIdentifier: String {
        return Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
    }
    
    static var bundleName: String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
}

// MARK: - Methods
public extension Bundle {

    /// App's icon image
    ///
    /// - Returns: UIImage
    public static func icon() -> UIImage? {
        let iconFilename = Bundle.main.object(forInfoDictionaryKey: "CFBundleIconFile")
        let iconBasename = (iconFilename as! NSString).deletingPathExtension
        let iconExtension = (iconFilename as! NSString).pathExtension
        let iconFile = Bundle.main.path(forResource: iconBasename, ofType: iconExtension)!
        guard let image = UIImage(contentsOfFile:iconFile) else {
            return nil
        }
        return image
    }
}
