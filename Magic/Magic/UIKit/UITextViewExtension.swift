//
//  UITextViewExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/16.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

fileprivate var kPlaceholderLabelAssociativeKey = "kPlaceholderLabelAssociativeKey"
fileprivate var kPlaceholderAssociativeKey = "kPlaceholderAssociativeKey"

extension UITextView {
   fileprivate var placeholderLabel: UILabel {
        get {
            guard let placeholderLabel = getAssociatedObject(&kPlaceholderLabelAssociativeKey) as? UILabel else {
                // TODO: fix
                let left = textContainer.lineFragmentPadding + textContainerInset.left
                let top = textContainerInset.top
                //                let right = -textContainerInset.right
                let right = -CGFloat(0.0)
                let bottom = -CGFloat(0.0)
                
                let placeholderLabel = UILabel()
                
                placeholderLabel.numberOfLines = 0
                placeholderLabel.isUserInteractionEnabled = false
                placeholderLabel.text = getAssociatedObject(&kPlaceholderAssociativeKey) as? String
                NotificationCenter.default.addObserver(forName: .UITextViewTextDidChange, object: nil, queue: OperationQueue.main, using: { (notificaton) in
                    if self.text.lengthOfBytes(using: String.Encoding.utf8) > 0 {
                        self.placeholderLabel.isHidden = true
                    } else {
                        self.placeholderLabel.isHidden = false
                    }
                })
//                placeholderLabel.textColor = UIColor(red: 0, green: 0, blue: 25 / 255.0, alpha: 0.22)
                placeholderLabel.preferredMaxLayoutWidth = 200
                placeholderLabel.textColor = UIColor.black
                placeholderLabel.backgroundColor = UIColor.red
                setAssociatedObject(placeholderLabel as AnyObject?, associativeKey: &kPlaceholderLabelAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                addSubview(placeholderLabel)
                
                placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
                print(placeholderLabel.constraints)
                self.addConstraint(NSLayoutConstraint(item: placeholderLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: top))
                self.addConstraint(NSLayoutConstraint(item: placeholderLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: left))
                self.addConstraint(NSLayoutConstraint(item: placeholderLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: right))
                self.addConstraint(NSLayoutConstraint(item: placeholderLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: bottom))
                
                return placeholderLabel
            }
            return placeholderLabel
        }
        
        set {
            setAssociatedObject(newValue as AnyObject?, associativeKey: &kPlaceholderLabelAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var placeholder: String? {
        get {
            return getAssociatedObject(&kPlaceholderAssociativeKey) as? String
        }
        
        set {
            setAssociatedObject(newValue as AnyObject?, associativeKey: &kPlaceholderAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            placeholderLabel.text = newValue
//             print(placeholderLabel.constraints)
//            placeholderLabel.constraints.forEach {
//                placeholderLabel.removeConstraint($0)
//            }
//            self.layoutIfNeeded()
            self.updateConstraints()
        }
    }
}



