//
//  UINavigationControllerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/14.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation
import ObjectiveC

extension UINavigationController {
    var bottomSeparatorHidden: Bool {
        get {
            var hidden = false
            navigationBar.subviews.forEach {
                if ($0.isKind(of: NSClassFromString("_UINavigationBarBackground")!)) {
                    $0.subviews.forEach({ (subview) in
                        if (subview.isKind(of: UIImageView.self)) {
                            let imageView: UIImageView = subview as! UIImageView
                            hidden = imageView.isHidden
                        }
                    })
                }
            }
            return hidden
        }
        
        set {
            navigationBar.subviews.forEach {
                if ($0.isKind(of: NSClassFromString("_UINavigationBarBackground")!)) {
                    $0.subviews.forEach({ (subview) in
                        if (subview.isKind(of: UIImageView.self)) {
                            let imageView: UIImageView = subview as! UIImageView
                            imageView.isHidden = newValue
                        }
                    })
                }
            }
        }
    }

}

extension UINavigationController {
    /**
     Push with UIViewAnimationTransition
     
     - parameter controller: target viewController
     - parameter transition: UIViewAnimationTransition
     */
    public func pushViewController(_ controller: UIViewController, transition: UIViewAnimationTransition) {
        UIView.beginAnimations(nil, context: nil)
        pushViewController(controller, animated: false)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationTransition(transition, for: self.view, cache: true)
        UIView.commitAnimations()
    }
    
    /**
     Pop with UIViewAnimationTransition
     
     - parameter controller: target viewController
     - parameter transition: UIViewAnimationTransition
     
     - returns: UIViewController
     */
    public func popViewController(_ controller: UIViewController, transition: UIViewAnimationTransition) -> UIViewController {
        UIView.beginAnimations(nil, context: nil)
        let controller = popViewController(animated: false)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationTransition(transition, for: self.view, cache: true)
        UIView.commitAnimations()
        return controller!
    }
}
