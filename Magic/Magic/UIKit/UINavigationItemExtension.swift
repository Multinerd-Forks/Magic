//
//  UINavigationItemExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/12/7.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

enum LoadingPosition : Int {
    
    case center = 0
    
    case left
    
    case right
}

fileprivate var kLoadingPositionAssociationKey = "kLoadingPositionAssociationKey"
fileprivate var kSubstitutedViewAssociationKey = "kSubstitutedViewAssociationKey"

extension UINavigationItem {
   
    func startAnimating(at position: LoadingPosition) {
        stopAnimating()
        objc_setAssociatedObject(self, kLoadingPositionAssociationKey, position, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        let loader = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        switch position {
        case .left:
            objc_setAssociatedObject(self, kSubstitutedViewAssociationKey, leftBarButtonItem!.customView!, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            leftBarButtonItem!.customView! = loader
        case .center:
            objc_setAssociatedObject(self, kSubstitutedViewAssociationKey, titleView!, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            titleView! = loader
        case .right:
            objc_setAssociatedObject(self, kSubstitutedViewAssociationKey, rightBarButtonItem!.customView!, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            rightBarButtonItem!.customView! = loader
        }
        
        loader.startAnimating()
    }
 
    func stopAnimating() {
        let positionToRestore = objc_getAssociatedObject(self, kLoadingPositionAssociationKey) as! LoadingPosition
        let componentToRestore = objc_getAssociatedObject(self, kSubstitutedViewAssociationKey) as! UIView
        
        switch positionToRestore {
        case .left:
            leftBarButtonItem!.customView! = componentToRestore
        case .center:
            titleView! = componentToRestore
        case .right:
            rightBarButtonItem!.customView! = componentToRestore
        }
        
        objc_setAssociatedObject(self, kLoadingPositionAssociationKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, kSubstitutedViewAssociationKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
