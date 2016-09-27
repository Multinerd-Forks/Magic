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
    
//    func presentAlert(title: String,
//                             message: String? = nil,
//                             buttonText: String = "OK",
//                             additionalActions: [UIAlertAction]? = nil,
//                             preferredStyle: UIAlertControllerStyle = .alert,
//                             includeCancelAction: Bool = false,
//                             handler: (() -> Void)? = nil) {
//        let alertController = UIAlertController(
//            title: title,
//            message: message,
//            preferredStyle: preferredStyle
//        )
//        
//        if includeCancelAction {
//            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        }
//        
//        if let additionalActions = additionalActions {
//            additionalActions.forEach { item in
//                alertController.addAction(item)
//            }
//        }
//        
//        alertController.addAction(UIAlertAction(title: buttonText) { handler?() })
//        
//        present(alertController, animated: true, completion: nil)
//    }
    
    @available(iOSApplicationExtension 9.0, *)
    func presentSafariController(url: String, modalPresentationStyle: UIModalPresentationStyle = .overFullScreen) {
        let safariController = SFSafariViewController(url: URL(string: url)!)
        safariController.modalPresentationStyle = .overFullScreen
        
        safariController.delegate = self as? SFSafariViewControllerDelegate
        
        present(safariController, animated: true, completion: nil)
    }
    

    func presentActivityViewController(activityItems: [AnyObject],
                                              sourceView: UIView, applicationActivities: [UIActivity]? = nil) {
        let activity = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
        if let popOver = activity.popoverPresentationController {
            popOver.sourceView = sourceView
            popOver.sourceRect = sourceView.bounds
            popOver.permittedArrowDirections = .any
        }
        
        present(activity, animated: true, completion: nil)
    }
    
    func presentActivityViewController(activityItems: [AnyObject],
                                              barButtonItem: UIBarButtonItem, applicationActivities: [UIActivity]? = nil) {
        let activity = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
        if let popOver = activity.popoverPresentationController {
            popOver.barButtonItem  = barButtonItem
            popOver.permittedArrowDirections = .any
        }
        
        present(activity, animated: true, completion: nil)
    }
    
}
