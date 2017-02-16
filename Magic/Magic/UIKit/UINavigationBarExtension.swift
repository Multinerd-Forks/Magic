//
//  UINavigationBarExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/14.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Properties
fileprivate var kBarHeightAssociativeKey = "kBarHeightAssociativeKey"
extension UINavigationBar {
    public var barHeight: CGFloat {
        get {
            return getAssociatedObject(&kBarHeightAssociativeKey) as? CGFloat ?? 44
        }
        
        set {
            setAssociatedObject(newValue, associativeKey: kBarHeightAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: self.superview!.bounds.size.width, height: barHeight)
    }
}

// MARK: - Methods
extension UINavigationBar {
    
    func setColor(_ color: UIColor, for barMetrics: UIBarMetrics) {
        let backgroundImage = UIImage(color: color)
        setBackgroundImage(backgroundImage, for: barMetrics)
    }
    
    func hideBottomBorder() {
        self.shadowImage = UIImage()
    }
    
    func setBottomBorderColor(color: UIColor, height: CGFloat) {
        let bottomBorderRect = CGRect(x: 0, y: frame.height, width: frame.width, height: height)
        let bottomBorderView = UIView(frame: bottomBorderRect)
        bottomBorderView.backgroundColor = color
        addSubview(bottomBorderView)
    }
    
    func beginLoading(prompt: String) {
    
    }
}
