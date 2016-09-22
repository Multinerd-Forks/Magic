//
//  UIApplicationExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UIApplication {
    public func registerUserNotificationSettings(
        identifier: String,
        actions: [UIMutableUserNotificationAction]? = nil,
        type: UIUserNotificationType = [ .alert, .badge, .sound ]) {
        
        var mainCategory: UIMutableUserNotificationCategory? = nil
        
        if let a = actions , a.count > 0 {
            mainCategory = UIMutableUserNotificationCategory()
            mainCategory!.identifier = identifier
            mainCategory!.setActions(a, for: .default)
            mainCategory!.setActions(a, for: .minimal)
        }
        
        let notificationSettings = UIUserNotificationSettings(
            types: type,
            categories: mainCategory != nil
                ? [mainCategory!]
                : nil)
        registerUserNotificationSettings(notificationSettings)
    }

    public func removeLocalNotification(identifier: String) {
        guard let notifications = self.scheduledLocalNotifications
            , notifications.count > 0 else {
                return
        }
        
        for item in notifications {
            if let id = item.userInfo?["identifier"] as? String
                , id == identifier {
                self.cancelLocalNotification(item)
            }
        }
    }
    
    public func clearNotificationTray() {
        self.applicationIconBadgeNumber = 1
        self.applicationIconBadgeNumber = 0
    }
    
    @available(iOSApplicationExtension 9.0, *)
    public func updateShortcutItem(type: String, handler: (UIMutableApplicationShortcutItem) -> UIMutableApplicationShortcutItem) {
        guard let index = shortcutItems?.index(where: { $0.type == type }),
            let item = shortcutItems?[index].mutableCopy() as? UIMutableApplicationShortcutItem else {
                return
        }
        
        shortcutItems?[index] = handler(item)
    }
}
