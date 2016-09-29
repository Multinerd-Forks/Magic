//
//  UIColorExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// init
public extension UIColor {
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
        
        guard let hex = Int(formatted!, radix: 16), formatted != nil else {
            return nil
        }
        
        self.init(hex: hex)
    }
    
    public convenience init(hex: Int) {
        assert(hex >= 0 && hex <= 0xffffff, "Invalid hex value.")
        let red = CGFloat((hex >> 16) & 0xff) / 255.0
        let green = CGFloat((hex >> 8) & 0xff) / 255.0
        let blue = CGFloat(hex & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

// property
public extension UIColor {
    var redValue: CGFloat? {
        return cgColor.components?[0]
    }
    
    var greenValue: CGFloat? {
        return cgColor.components?[1]
    }
    
    var blueValue: CGFloat? {
        return cgColor.components?[2]
    }
    
    var alphaValue: CGFloat? {
        return cgColor.components?[3]
    }
    
    public class var randomHSBColor: UIColor {
        return randomHSBColor(alpha: 1)
    }
    
    public class var randomRGBColor: UIColor {
        return randomRGBColor(alpha: 1)
    }
}

// function
public extension UIColor {
    func inverse() -> UIColor {
        assert(cgColor.components != nil, "Color is nil")
        return UIColor(red: 1.0 - cgColor.components![0], green: 1.0 - cgColor.components![1], blue: 1.0 - cgColor.components![2], alpha: cgColor.components![3])
    }
}

public extension UIColor {
    public class func randomHSBColor(alpha: CGFloat) -> UIColor {
        let hue = CGFloat(arc4random()).truncatingRemainder(dividingBy: 256.0) / 256.0
        let saturation = CGFloat(arc4random()).truncatingRemainder(dividingBy: 128.0) / 256.0 + 0.5
        let brightness = CGFloat(arc4random()).truncatingRemainder(dividingBy: 128.0) / 256.0 + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha);
    }
    
    public class func randomRGBColor(alpha: CGFloat) -> UIColor {
        let red = CGFloat(arc4random()).truncatingRemainder(dividingBy: 256.0) / 256.0
        let green = CGFloat(arc4random()).truncatingRemainder(dividingBy: 128.0) / 256.0
        let blue = CGFloat(arc4random()).truncatingRemainder(dividingBy: 128.0) / 256.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
