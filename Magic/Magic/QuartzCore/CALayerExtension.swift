//
//  CALayerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension CALayer {
    func addSublayers(sublayers: CALayer...) {
        sublayers.forEach {
            addSublayer($0)
        }
    }
    
    func removeSublayer() {
        sublayers?.forEach {
            $0.removeFromSuperlayer()
        }
    }
}
