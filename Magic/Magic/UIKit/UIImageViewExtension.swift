//
//  UIImageViewExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Initializers
extension UIImageView {
    convenience init(imageName: String) {
        self.init(image: UIImage(named: imageName))
    }
}

// MARK: - Methods
public extension UIImageView {
    func reflect() {
        var frame = self.frame
        frame.origin.y += (frame.size.height + 1)
        let reflectionImageView = UIImageView(frame: frame)
        clipsToBounds = true
        reflectionImageView.contentMode = contentMode
        reflectionImageView.image = image
        reflectionImageView.transform = CGAffineTransform(scaleX: 1.0, y: -1.0)
        let reflectionLayer = reflectionImageView.layer
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.bounds = reflectionLayer.bounds
        gradientLayer.position = CGPoint(x: reflectionLayer.bounds.size.width / 2, y: reflectionLayer.bounds.size.height * 0.5)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        reflectionLayer.mask = gradientLayer
        superview!.addSubview(reflectionImageView)
    }
}
