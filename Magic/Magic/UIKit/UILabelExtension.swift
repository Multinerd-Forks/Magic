//
//  UILabelExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/22.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Properties
public extension UILabel {
    var estimatedSize: CGSize {
        return sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
    }
    
    var estimatedHeight: CGFloat {
        return sizeThatFits(CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude)).height
    }
    
    var estimatedWidth: CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.frame.size.height)).width
    }
}

// MARK: - Methods
public extension UILabel {
    var contentSize: CGSize {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.alignment = textAlignment
        
        let attributes = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle] as [String : Any]
        
        let contentSize = text!.boundingRect(
            with: frame.size,
            options: ([.usesLineFragmentOrigin, .usesFontLeading]),
            attributes: attributes,
            context: nil
            ).size
        return contentSize
    }
    
    func vertical() {
        assert(self.text == nil, "Invalid label text.")
        let textAttributes: [String : AnyObject] = [NSFontAttributeName: self.font]
        let labelSize = self.text?.boundingRect(with: CGSize(width: font.pointSize, height: .greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        attributedText = NSAttributedString(string: text!, attributes: textAttributes)
        lineBreakMode = .byCharWrapping
        numberOfLines = 0
        self.frame = labelSize!
    }
}
