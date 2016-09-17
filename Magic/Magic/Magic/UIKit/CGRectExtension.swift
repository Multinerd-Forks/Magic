//
//  CGRectExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// property
extension CGRect {
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
            self.size.width = newValue
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
}
