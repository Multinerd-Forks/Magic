//
//  CALayerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Methods
public extension CALayer {
    func addSublayers(sublayers: CALayer...) {
        sublayers.forEach {
            addSublayer($0)
        }
    }
    
    func removeSublayers() {
        sublayers?.forEach {
            $0.removeFromSuperlayer()
        }
    }
}

// MARK: - Methods
public extension CALayer {
    class func performWithoutAnimation(handler: () -> Void) {
        CATransaction.begin()
        CATransaction.setValue(true, forKey: kCATransactionDisableActions)
        handler()
        CATransaction.commit()
    }
}

