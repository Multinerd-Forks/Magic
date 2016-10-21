//
//  UIWebViewExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/13.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

extension UIWebView {
    var documentTitle: String? {
        return stringByEvaluatingJavaScript(from: "document.title")
    }
}
