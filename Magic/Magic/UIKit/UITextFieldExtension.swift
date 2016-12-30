//
//  UITextFieldExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Properties
public extension UITextField {
    /// Check if text field is empty.
     var isEmpty: Bool {
        if let text = self.text {
            return text.characters.isEmpty
        }
        return true
    }
    
    var leftPadding: CGFloat {
        set {
            leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: newValue, height: frame.height))
            leftViewMode = .always
        }
        get {
            return leftView?.frame.size.width ?? 0.0
        }
    }
    
    var rightPadding: CGFloat {
        set {
            rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: newValue, height: frame.height))
            rightViewMode = .always
        }
        get {
            return rightView?.frame.size.width ?? 0.0
        }
    }
    
    var selectedRange: NSRange? {
        get {
            guard let selectedRange = selectedTextRange else {
                return nil
            }
            let location = offset(from: beginningOfDocument, to: selectedRange.start)
            let length = offset(from: selectedRange.start, to: selectedRange.end)
            return NSRange(location: location, length: length)
        }
        set {
            if newValue != nil {
                let startPosition = position(from: beginningOfDocument, offset: newValue!.location)
                let endPosition = position(from: beginningOfDocument, offset: newValue!.location + newValue!.length)
                selectedTextRange = textRange(from: startPosition!, to: endPosition!)
            } else {
                let startPosition = position(from: beginningOfDocument, offset: 0)
                let endPosition = position(from: beginningOfDocument, offset: 0)
                self.selectedTextRange = textRange(from: startPosition!, to: endPosition!)
            }
        }
    }
    
    var placeHolderTextColor: UIColor {
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue])
        }
        
        get {
            // TODO:
            return UIColor.lightGray
        }
    }
}

// MARK: - Methods
public extension UITextField {
    
    func addDoneButton(_ barStyle: UIBarStyle = .default, title: String? = "Done") {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: title, style: .done, target: self, action: #selector(resignFirstResponder))
        ]
        
        keyboardToolbar.barStyle = barStyle
        keyboardToolbar.sizeToFit()
        
        inputAccessoryView = keyboardToolbar
    }
}

fileprivate var kLimitLengthAssociativeKey = "kLimitLengthAssociativeKey"
// MARK: - Properties
public extension UITextField {
    var limitLength: Int? {
        get {
            guard let length = getAssociatedObject(&kLimitLengthAssociativeKey) as? Int else {
                return nil
            }
            return length
        }
        
        set {
            NotificationCenter.default.addObserver(forName: .UITextViewTextDidChange, object: nil, queue: OperationQueue.main) { (notification) in
                if let textField = notification.object as? UITextView,
                    self == textField {
                    if textField.text.lengthOfBytes(using: .utf8) >= newValue! {
                        textField.text = (self.text! as NSString).substring(with: NSMakeRange(0, newValue!))
                    }
                }
            }
            setAssociatedObject(newValue as AnyObject?, associativeKey:&kLimitLengthAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
