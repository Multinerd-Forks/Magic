//
//  CIImageExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension CIImage {
    func generateImage(size: CGSize) -> UIImage {
        let extent = self.extent.integral
        let scale = min(size.width / extent.width, size.height / extent.height)
        
        let width = extent.width * scale
        let height = extent.height * scale
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let bitmapRef = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        let context = CIContext(options: nil)
        let bitmapImage = context.createCGImage(self, from: extent)
        bitmapRef!.interpolationQuality = .none
        bitmapRef!.scaleBy(x: scale, y: scale)
        bitmapRef?.draw(bitmapImage!, in: extent)
        
        let scaledImage = bitmapRef!.makeImage()
        return UIImage(cgImage: scaledImage!)
    }
}
