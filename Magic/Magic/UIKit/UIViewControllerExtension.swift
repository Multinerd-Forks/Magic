//
//  UIViewControllerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation
import SafariServices

public extension UIViewController {
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

public extension UIViewController {
    @available(iOSApplicationExtension 9.0, *)
    func presentSafariController(url: String, modalPresentationStyle: UIModalPresentationStyle = .overFullScreen) {
        let safariController = SFSafariViewController(url: URL(string: url)!)
        safariController.modalPresentationStyle = .overFullScreen
        
        safariController.delegate = self as? SFSafariViewControllerDelegate
        
        present(safariController, animated: true, completion: nil)
    }
    

    func presentActivityViewController(activityItems: [AnyObject],
                                          sourceView: UIView,
                               applicationActivities: [UIActivity]? = nil) {
        let activity = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
        if let popover = activity.popoverPresentationController {
            popover.sourceView = sourceView
            popover.sourceRect = sourceView.bounds
            popover.permittedArrowDirections = .any
        }
        
        present(activity, animated: true, completion: nil)
    }
    
    func presentActivityViewController(activityItems: [AnyObject],
                                       barButtonItem: UIBarButtonItem,
                               applicationActivities: [UIActivity]? = nil) {
        let activity = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
        if let popover = activity.popoverPresentationController {
            popover.barButtonItem  = barButtonItem
            popover.permittedArrowDirections = .any
        }
        
        present(activity, animated: true, completion: nil)
    }
}

