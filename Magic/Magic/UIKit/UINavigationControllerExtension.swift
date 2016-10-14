//
//  UINavigationControllerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/14.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

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
