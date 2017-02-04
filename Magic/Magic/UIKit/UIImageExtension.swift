//
//  UIImageExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation
import Accelerate

// MARK: - Initializers
public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard (image?.cgImage) != nil else {
            return nil
        }
        self.init(cgImage: image!.cgImage!)
    }
}

// MARK: - Methods
public extension UIImage {
    func scale(to size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        draw(in: CGRect(origin: .zero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
    
    func cropping(to rect: CGRect) -> UIImage {
        let croppedImageRef = cgImage!.cropping(to: rect)
        return UIImage(cgImage: croppedImageRef!)
    }
    
    func tint(_ tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: size.height)
        context?.scaleBy(x: 1.0, y: -1.0);
        context?.setBlendMode(.normal)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.clip(to: rect, mask: cgImage!)
        tintColor.setFill()
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func blur(degree: Int) -> UIImage? {
        let boxSize = degree - (degree % 2) + 1
        
        guard let image = self.cgImage else {
            return nil
        }
        
        let inProvider = image.dataProvider
        let height = vImagePixelCount(image.height)
        let width = vImagePixelCount(image.width)
        let rowBytes = image.bytesPerRow
        let inBitmapData = inProvider!.data
        let inData = UnsafeMutableRawPointer(mutating: CFDataGetBytePtr(inBitmapData))
        var inBuffer = vImage_Buffer(data: inData, height: height, width: width, rowBytes: rowBytes)
        
        let outData = malloc(image.bytesPerRow * image.height)
        var outBuffer = vImage_Buffer(data: outData, height: height, width: width, rowBytes: rowBytes)
        
        vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, nil, 0, 0, UInt32(boxSize), UInt32(boxSize), nil, vImage_Flags(kvImageEdgeExtend))
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: outBuffer.data, width: Int(outBuffer.width), height: Int(outBuffer.height), bitsPerComponent: 8, bytesPerRow: outBuffer.rowBytes, space: colorSpace, bitmapInfo: image.bitmapInfo.rawValue)
        let imageRef = context!.makeImage()!
        let bluredImage = UIImage(cgImage: imageRef)
        free(outData)
        
        return bluredImage
    }
    
    class func merge(_ firstImage: UIImage, with secondImage: UIImage) -> UIImage {
        let firstImageRef = firstImage.cgImage!
        let firstWidth: CGFloat = CGFloat(firstImageRef.width)
        let firstHeight: CGFloat = CGFloat(firstImageRef.height)
        let secondImageRef = secondImage.cgImage!
        let secondWidth: CGFloat = CGFloat(secondImageRef.width)
        let secondHeight: CGFloat = CGFloat(secondImageRef.height)
        let mergedSize = CGSize(width: max(firstWidth, secondWidth), height: max(firstHeight, secondHeight))
        UIGraphicsBeginImageContext(mergedSize)
        firstImage.draw(in: CGRect(x: 0, y: 0, width: firstWidth, height: firstHeight))
        
        secondImage.draw(in: CGRect(x: 0, y: 0, width: secondWidth, height: secondHeight))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func tgradientImage(with gradientColors: [UIColor], blendMode: CGBlendMode = .normal) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(blendMode)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.draw(cgImage!, in: rect)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = gradientColors.map {(color: UIColor) -> AnyObject! in return color.cgColor as AnyObject! } as NSArray
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil)
        context?.clip(to: rect, mask: cgImage!)
        context?.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: size.height), options: CGGradientDrawingOptions(rawValue: 0))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image!;
    }
}

// MARK: - Methods
public extension UIImage {
    func fixOrientation() -> UIImage {
        
        if imageOrientation == .up {
            return self
        }
        
        var transform = CGAffineTransform.identity
        
        switch imageOrientation {
        case .down,
             .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: CGFloat(M_PI))
            break
      
        case .left,
             .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: CGFloat(M_PI_2))
            break
            
        case .right,
             .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: CGFloat(-M_PI_2))
            break
        case .up,
             .upMirrored:
            break
        }
        
        switch imageOrientation {
        case .upMirrored,
             .downMirrored:
            transform.translatedBy(x: size.width, y: 0)
            transform.scaledBy(x: -1, y: 1)
            break
        case .leftMirrored,
             .rightMirrored:
            transform.translatedBy(x: size.height, y: 0)
            transform.scaledBy(x: -1, y: 1)
        case .up,
             .down,
             .left,
             .right:
            break
        }
        
        let ctx = CGContext(data: nil,
                            width: Int(size.width),
                            height: Int(size.height),
                            bitsPerComponent: cgImage!.bitsPerComponent,
                            bytesPerRow: 0,
                            space: cgImage!.colorSpace!,
                            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        
        ctx.concatenate(transform)
        
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
            break
        default:
             ctx.draw(cgImage!, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            break
        }
        
        let cgimage = ctx.makeImage()!
        let image = UIImage(cgImage: cgimage)
        
        return image
    }
}
