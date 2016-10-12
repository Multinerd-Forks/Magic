//
//  UIAlertControllerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension UIAlertController {
    class func showAlert(
        title: String?,
        message: String?,
        cancelTitle: String?,
        confirmTitle: String?,
        confirmHandler: ((UIAlertAction) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelTitle, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: confirmTitle, style: .default, handler: confirmHandler))
       
        alert.show()
    }
    
    func show() {
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
    }
}
