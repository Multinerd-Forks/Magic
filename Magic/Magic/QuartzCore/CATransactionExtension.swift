//
//  CATransactionExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension CATransaction {
    class func animate(withDuration duration: TimeInterval, animations: (() -> Void)?, completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        if completion != nil {
            CATransaction.setCompletionBlock(completion)
        }
        if animations != nil{
            animations!()
        }
        CATransaction.commit()
    }
}
