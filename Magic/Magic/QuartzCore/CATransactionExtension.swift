//
//  CATransactionExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension CATransaction {
    class func animate(duration: TimeInterval, animation: (() -> Void)?, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        if completion != nil {
            CATransaction.setCompletionBlock(completion)
        }
        if animation != nil{
            animation!()
        }
        CATransaction.commit()
    }
}
