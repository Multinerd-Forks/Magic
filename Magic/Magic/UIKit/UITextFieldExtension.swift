//
//  UITextFieldExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension UITextField {
    var leftPadding: CGFloat {
        set {
            leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: newValue, height: frame.height))
            leftViewMode = .always
        }
        get {
            return leftView?.frame.size.width ?? 0.0
        }
    }
    
    public func addDoneButton(_ barStyle: UIBarStyle = .default, title: String? = "Done") {
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
