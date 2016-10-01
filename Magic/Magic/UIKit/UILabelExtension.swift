//
//  UILabelExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UILabel {
    func contentSize() -> CGSize {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAlignment
        let attributes = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle]
        
        let contentSize = text!.boundingRect(
            with: frame.size,
            options: ([.usesLineFragmentOrigin, .usesFontLeading]),
            attributes: attributes,
            context: nil
            ).size
        return contentSize
    }
}
