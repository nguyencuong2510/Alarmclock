//
//  Extension+AppDelegate.swift
//  Alarmclock
//
//  Created by cuongnv on 8/21/18.
//  Copyright © 2018 vn.com.vinicorp. All rights reserved.
//

import UserNotifications

extension AppDelegate: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "action1": print("da vao action 1")
        case "action2": print("da vao action 2")
        default:
            break
        }
        completionHandler()
    }
    
}
