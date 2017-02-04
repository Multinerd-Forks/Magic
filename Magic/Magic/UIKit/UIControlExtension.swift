//
//  UIControlExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Methods
extension UIControl {

    fileprivate class ActionStorage {
        
        var control: UIControl
        var action: (UIControl) -> Void
        
        init(_ control: UIControl, action: @escaping (UIControl) -> Void) {
            self.control = control
            self.action = action
        }
        
        @objc func triggerEventAction() {
            action(control)
        }
    }
    
    func actionHandle(for controlEvent: UIControlEvents, action: @escaping (UIControl) -> Void) {
        let actionStorage = ActionStorage(self, action: action)
       addTarget(actionStorage, action: #selector(ActionStorage.triggerEventAction), for: controlEvent)
    }
}


