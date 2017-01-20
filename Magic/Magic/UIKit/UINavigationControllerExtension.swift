//
//  UINavigationControllerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/10/14.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation
import ObjectiveC

// MARK: - Properties
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

// MARK: - Methods
extension UINavigationController {

    /// Push with UIViewAnimationTransition
    ///
    /// - Parameters:
    ///   - controller: target viewController
    ///   - transition: UIViewAnimationTransition
    func pushViewController(_ controller: UIViewController, transition: UIViewAnimationTransition) {
        UIView.beginAnimations(nil, context: nil)
        pushViewController(controller, animated: false)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationTransition(transition, for: self.view, cache: true)
        UIView.commitAnimations()
    }
    
    /// Pop with UIViewAnimationTransition
    ///
    /// - Parameters:
    ///   - controller: target viewController
    ///   - transition: UIViewAnimationTransition
    /// - Returns: UIViewController
    func popViewController(_ controller: UIViewController, transition: UIViewAnimationTransition) -> UIViewController {
        UIView.beginAnimations(nil, context: nil)
        let controller = popViewController(animated: false)
        UIView.setAnimationDuration(0.25)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationTransition(transition, for: self.view, cache: true)
        UIView.commitAnimations()
        return controller!
    }
    
    /// Pop ViewController with completion handler.
    ///
    /// - Parameter completion: optional completion handler (default is nil).
    func popViewController(completion: (()->Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: true)
        CATransaction.commit()
    }

    /// Push ViewController with completion handler
    ///
    /// - Parameters:
    ///   - viewController: viewController to push
    ///   - completion: optional completion handler
    func pushViewController(viewController: UIViewController, completion: (()->Void)? = nil)  {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
}
