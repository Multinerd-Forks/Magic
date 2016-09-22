//
//  UIStoryboardExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UIStoryboard {
    public convenience init(name: String) {
        self.init(name: name, bundle: nil)
    }
    
    public func instantiateViewController<T: UIViewController>() -> T? {
        return instantiateViewController(withIdentifier: String(describing: T.self)) as? T
    }
}
