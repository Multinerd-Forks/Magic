//
//  UISwitchExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Methods
extension UISwitch {
    public func toggle(animated: Bool = true) {
        self.setOn(!self.isOn, animated: animated)
    }
}
