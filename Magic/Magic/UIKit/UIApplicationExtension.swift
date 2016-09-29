//
//  UIApplicationExtension.swift
//  Magic
//
//  Created by Broccoli on 2016/9/21.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

public extension UIApplication {
    func registerUserNotificationSettings(
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

    func removeLocalNotification(identifier: String) {
        guard let notifications = scheduledLocalNotifications
            , notifications.count > 0 else {
                return
        }
        
        for item in notifications {
            if let id = item.userInfo?["identifier"] as? String
                , id == identifier {
                cancelLocalNotification(item)
            }
        }
    }
    
    func clearNotificationTray() {
        applicationIconBadgeNumber = 1
        applicationIconBadgeNumber = 0
    }
    
    @available(iOSApplicationExtension 9.0, *)
    func updateShortcutItem(type: String, handler: (UIMutableApplicationShortcutItem) -> UIMutableApplicationShortcutItem) {
        guard let index = shortcutItems?.index(where: { $0.type == type }),
            let item = shortcutItems?[index].mutableCopy() as? UIMutableApplicationShortcutItem else {
                return
        }
        
        shortcutItems?[index] = handler(item)
    }
}
