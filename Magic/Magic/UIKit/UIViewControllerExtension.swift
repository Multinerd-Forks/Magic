//
//  UIViewControllerExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation
import SafariServices

// MARK: - Properties
public extension UIViewController {
    
    /// Check if ViewController is onscreen and not hidden.
    public var isVisible: Bool {
        return self.isViewLoaded && view.window != nil
    }
    
    /// NavigationBar in a ViewController.
    public var navigationBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
    
}

// MARK: - Methods
public extension UIViewController {
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Methods
public extension UIViewController {
    @available(iOSApplicationExtension 9.0, *)
    func presentSafariController(URL url: String, modalPresentationStyle: UIModalPresentationStyle = .overFullScreen) {
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


// MARK: - Methods
public extension UIViewController {
    
    /// Assign as listener to notification.
    ///
    /// - Parameters:
    ///   - name: notification name.
    ///   - selector: selector to run with notified.
    public func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    
    /// Unassign as listener to notification.
    ///
    /// - Parameter name: notification name.
    public func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }
    
    /// Unassign as listener from all notifications.
    public func removeNotificationsObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}

