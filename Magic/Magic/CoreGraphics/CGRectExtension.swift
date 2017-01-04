//
//  CGRectExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import CoreGraphics

// MARK: - Properties
public extension CGRect {
     var x: CGFloat {
        get {
            return origin.x
        }
        
        set {
            origin.x = newValue
        }
    }
    
     var y: CGFloat {
        get {
            return origin.y
        }
        
        set {
            origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return size.width
        }
        
        set {
            size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return size.height
        }
        
        set {
            size.height = newValue
        }
    }
    
    var left: CGFloat {
        get {
            return origin.x
        }
        set {
            origin.x = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            return x + width
        }
        
        set {
            x = newValue - width
        }
    }
    
     var top: CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }
     var bottom: CGFloat {
        get {
            return y + height
        }
        set {
            y = newValue - height
        }
    }
}
