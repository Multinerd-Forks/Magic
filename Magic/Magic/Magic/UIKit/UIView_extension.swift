//
//  UIView_extension.swift
//  Magic
//
//  Created by Broccoli on 16/9/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// property
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.masksToBounds = true
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else {
                return nil
            }
            return UIColor(CGColor: borderColor)
        }
        
        set {
            layer.borderColor = borderColor?.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var origin: CGPoint {
        get {
            return frame.origin
        }
        
        set {
            var frame = self.frame
            frame.origin = origin
            self.frame = frame
        }
    }
    
    @IBInspectable var size: CGSize {
        get {
            return self.frame.size;
        }
        
        set {
            var frame = self.frame
            frame.size = size
            self.frame = frame
        }
    }
    
    var snapshot: UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 0, 0)
        layer.renderInContext(context!)
        let viewImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return viewImage
    }
}

extension UIView {
    
}