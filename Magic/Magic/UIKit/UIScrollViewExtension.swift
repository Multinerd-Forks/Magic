//
//  UIScrollViewExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/13.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UIScrollView {
    enum Direction {
        case Bottom
        case Top
        case Right
        case Left
    }
    
    func scroll(to direction: Direction, animated: Bool = true) {
        var scrollOffset = self.contentOffset
        
        switch direction {
        case .Bottom:
            scrollOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        case .Top:
            scrollOffset = CGPoint(x: 0, y: contentSize.height + bounds.size.height)
        case .Left:
            scrollOffset = CGPoint(x: 0, y: contentSize.width - bounds.size.width)
        case .Right:
            scrollOffset = CGPoint(x: 0, y: contentSize.width + bounds.size.width)
        }
        
        setContentOffset(scrollOffset, animated: animated)
    }
}
