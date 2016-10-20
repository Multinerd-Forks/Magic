//
//  UIScreenExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

 public extension UIScreen {
    
    /// The center of the screen
   var center: CGPoint {
        return CGPoint(x: width/2, y: height/2)
    }
    
    /// The width of the screen
    var width: CGFloat {
        return bounds.width
    }
    
    /// The height of the screen
    var height: CGFloat {
        return bounds.height
    }
}
