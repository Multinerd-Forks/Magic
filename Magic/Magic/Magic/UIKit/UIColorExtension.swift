//
//  UIColorExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// init
extension UIColor {
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var formatted: String? = nil
        
        switch hexString.characters.count {
        case 8:
            formatted = hexString.replacingOccurrences(of: "0x", with: "")
        case 7:
            formatted = hexString.replacingOccurrences(of: "#", with: "")
        case 6:
            formatted = hexString
        default:
            return nil
        }
        
        guard formatted != nil else {
            return nil
        }
        
        if let hex = Int(formatted!, radix: 16) {
            let red = CGFloat(CGFloat((hex & 0xFF0000) >> 16)/255.0)
            let green = CGFloat(CGFloat((hex & 0x00FF00) >> 8)/255.0)
            let blue = CGFloat(CGFloat((hex & 0x0000FF) >> 0)/255.0)
            self.init(red: red, green: green, blue: blue, alpha: alpha)        } else {
            return nil
        }
    }
}

// property
extension UIColor {
    
    var redValue: CGFloat? {
        return cgColor.components?[0]
    }
    
    var greenValue: CGFloat? {
        return self.cgColor.components?[1]
    }
    
    var blueValue: CGFloat? {
        return self.cgColor.components?[2]
    }
    
    var alphaValue: CGFloat? {
        return self.cgColor.components?[3]
    }
}

// function
extension UIColor {
    func inverse() -> UIColor {
        assert(cgColor.components != nil, "Color is nil")
        return UIColor(red: 1.0 - cgColor.components![0], green: 1.0 - cgColor.components![1], blue: 1.0 - cgColor.components![2], alpha: cgColor.components![3])
    }
}
