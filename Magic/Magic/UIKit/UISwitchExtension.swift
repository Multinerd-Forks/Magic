//
//  UISwitchExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension UISwitch {
    
    public func toggle() {
        self.setOn(!self.isOn, animated: true)
    }
}
