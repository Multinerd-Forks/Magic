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
    
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = top
            self.frame = frame
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        
        set {
            var frame = self.frame
            frame.origin.y = bottom - self.frame.size.height
            self.frame = frame
        }
    }
    
    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        
        set {
            var frame = self.frame
            frame.origin.x = right - self.frame.size.width
            self.frame = frame
        }
    }
    
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = left
            self.frame = frame
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        
        set {
            var frame = self.frame;
            frame.size.width = width;
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        
        set {
            var frame = self.frame;
            frame.size.height = height;
            self.frame = frame
        }
    }
}

extension UIView {
    func containsSubView(subView: UIView) -> Bool {
        for view in subviews {
            if view == subView {
                return true
            }
        }
        return false
    }
    
    func removeSubViews() {
        for subView in subviews {
            subView.removeFromSuperview()
        }
    }
    
    func removeViewWithTag(tag: NSInteger) {
        for subView in subviews {
            if subView.tag == tag {
                subView.removeFromSuperview()
            }
        }
    }
}