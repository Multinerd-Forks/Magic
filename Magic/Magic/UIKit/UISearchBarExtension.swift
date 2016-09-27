//
//  UISearchBarExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UISearchBar {
    var cancelButton: UIButton? {
        get {
            var button: UIButton? = nil
            subviews.forEach {
                $0.subviews.forEach {
                    if let _ = $0 as? UIButton {
                        button = $0 as? UIButton
                    }
                }
            }
            return button
        }
    }
    
    var textField: UITextField? {
        get {
            var textField: UITextField? = nil
            subviews.forEach {
                $0.subviews.forEach {
                    if let _ = $0 as? UITextField {
                        textField = $0 as? UITextField
                    }
                }
            }
            return textField
        }
    }
}
