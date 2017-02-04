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

// MARK: - Properties
extension UITextView {
    fileprivate var placeholderLabel: UILabel {
        get {
            guard let placeholderLabel = getAssociatedObject(&kPlaceholderLabelAssociativeKey) as? UILabel else {
                let left = textContainer.lineFragmentPadding + textContainerInset.left
                let top = textContainerInset.top - 1
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
                placeholderLabel.backgroundColor = UIColor.red
                placeholderLabel.textColor = UIColor(red: 199 / 255.0, green: 199 / 255.0, blue: 205 / 255.0, alpha: 1.0)
                setAssociatedObject(placeholderLabel as AnyObject?, associativeKey: &kPlaceholderLabelAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                addSubview(placeholderLabel)
                
                placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
                
                addConstraint(NSLayoutConstraint(item: placeholderLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: top))
                addConstraint(NSLayoutConstraint(item: placeholderLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: left))
                addConstraint(NSLayoutConstraint(item: placeholderLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: right))
                addConstraint(NSLayoutConstraint(item: placeholderLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: bottom))
                
                let observingKeys = ["attributedText", "bounds", "font", "frame", "text", "textAlignment", "textContainerInset"];
                for key in observingKeys {
                    addObserver(self, forKeyPath: key, options: .new, context: nil)
                }
                return placeholderLabel
            }
            return placeholderLabel
        }
        
        set {
            setAssociatedObject(newValue as AnyObject?, associativeKey: &kPlaceholderLabelAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        placeholderLabel.preferredMaxLayoutWidth = frame.size.width - (textContainer.lineFragmentPadding + textContainerInset.left)
    }
    
    public var placeholder: String? {
        get {
            return getAssociatedObject(&kPlaceholderAssociativeKey) as? String
        }
        
        set {
            setAssociatedObject(newValue as AnyObject?, associativeKey: &kPlaceholderAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            placeholderLabel.text = newValue
        }
    }
}

fileprivate var kLimitLengthAssociativeKey = "kLimitLengthAssociativeKey"
// MARK: - Properties
public extension UITextView {
    var limitLength: Int? {
        get {
            guard let length = getAssociatedObject(&kLimitLengthAssociativeKey) as? Int else {
                return nil
            }
            return length
        }
        
        set {
            NotificationCenter.default.addObserver(forName: .UITextViewTextDidChange, object: nil, queue: OperationQueue.main) { (notification) in
                if let textView = notification.object as? UITextView,
                    self == textView {
                    if textView.text.lengthOfBytes(using: .utf8) >= newValue! {
                        textView.text = (self.text as NSString).substring(with: NSMakeRange(0, newValue!))
                    }
                }
            }
            setAssociatedObject(newValue as AnyObject?, associativeKey:&kLimitLengthAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}



