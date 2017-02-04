//
//  UIGestureRecognizerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Methods
extension UIGestureRecognizer {
    fileprivate class ActionStorage {
        
        var control: UIGestureRecognizer!
        var action: ((UIGestureRecognizer) -> Void)!
        
        @objc func triggerEventAction() {
            action(control)
        }
    }
    
    convenience init(action: @escaping (UIGestureRecognizer) -> ()) {
        let actionStorage = ActionStorage()
        self.init(target: actionStorage, action: #selector(ActionStorage.triggerEventAction))
        actionStorage.control = self
        actionStorage.action = action
    }
}

