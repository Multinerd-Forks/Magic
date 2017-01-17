//
//  NSAttributedStringExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Methods
public extension NSAttributedString {
    
    func bold() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)], range: range)
        return copy
    }
    
    func underline() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue], range: range)
        return copy
    }
    
    func italic() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([NSFontAttributeName: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)], range: range)
        return copy
    }
    
    func strikethrough() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        let attributes = [
            NSStrikethroughStyleAttributeName: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue as Int)]
        copy.addAttributes(attributes, range: range)
        
        return copy
    }
    
    func color(_ color: UIColor) -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }
        
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([NSForegroundColorAttributeName: color], range: range)
        return copy
    }
}
