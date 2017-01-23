//
//  UIBarButtonItemExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/13.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Methods
extension UIBarButtonItem {
    func addTarget(_ target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
}
