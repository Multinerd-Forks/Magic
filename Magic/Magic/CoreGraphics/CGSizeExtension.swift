//
//  CGSizeExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/14.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension CGSize {
    /**
     Aspect fit size
     
     - parameter boundingSize: boundingSize
     
     - returns: CGSize
     */
    func aspectFit(_ boundingSize: CGSize) -> CGSize {
        let ratio = min(boundingSize.width / width, boundingSize.height / height)
        return CGSize(width: width * ratio, height: height * ratio)
    }
}
