//
//  UIViewExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UIView {
    public class func fromNib<T : UIView>(nibName: String? = nil) -> T? {
        let name: String
        if let _ = nibName {
            name = nibName!
        } else {
            name = String(describing: T.self)
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for subview in nibViews! {
            if let _ = subview as? T {
                return subview as? T
            }
        }
        return nil
    }
}

// property
extension UIView {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.masksToBounds = true
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: borderColor)
        }
        
        set {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var origin: CGPoint {
        get {
            return frame.origin
        }
        
        set {
            var frame = self.frame
            frame.origin = origin
            self.frame = frame
        }
    }
    
    @IBInspectable public var size: CGSize {
        get {
            return self.frame.size;
        }
        
        set {
            var frame = self.frame
            frame.size = size
            self.frame = frame
        }
    }
    
    public var snapshot: UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: 0)
        layer.render(in: context!)
        let viewImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return viewImage!
    }
    
    public var top: CGFloat {
        get {
            return frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = top
            self.frame = frame
        }
    }
    
    public var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        
        set {
            var frame = self.frame
            frame.origin.y = bottom - self.frame.size.height
            self.frame = frame
        }
    }
    
    public var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        
        set {
            var frame = self.frame
            frame.origin.x = right - self.frame.size.width
            self.frame = frame
        }
    }
    
    public var left: CGFloat {
        get {
            return frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = left
            self.frame = frame
        }
    }
    
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        
        set {
            var frame = self.frame;
            frame.size.width = width;
            self.frame = frame
        }
    }
    
    public var height: CGFloat {
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

// function
public extension UIView {
    func containsSubView(_ subView: UIView) -> Bool {
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
    
    func removeViewWithTag(_ tag: NSInteger) {
        for subView in subviews {
            if subView.tag == tag {
                subView.removeFromSuperview()
            }
        }
    }
}
