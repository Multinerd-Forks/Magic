//
//  CGSizeExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/14.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

//// MARK: - Methods
extension CGSize {
    func aspectFit(_ boundingSize: CGSize) -> CGSize {
        let ratio = min(boundingSize.width / width, boundingSize.height / height)
        return CGSize(width: width * ratio, height: height * ratio)
    }
}

