//
//  Extension+Navigation.swift
//  Alarmclock
//
//  Created by cuongnv on 8/21/18.
//  Copyright © 2018 vn.com.vinicorp. All rights reserved.
//

import UIKit
import UserNotifications

extension UIViewController: UIPopoverPresentationControllerDelegate  {
    func setUpPopOverNavigation(to view: UIViewController, barItem: UIBarButtonItem)  {
        let navigation = UINavigationController(rootViewController: view)
        navigation.modalPresentationStyle = .popover
        navigation.popoverPresentationController?.delegate = self
        navigation.popoverPresentationController?.sourceView = self.view
        navigation.popoverPresentationController?.barButtonItem = barItem
        self.present(navigation, animated: true, completion: nil)
    }
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func createLocalNotification(title: String, subtitle: String,timeInterval: TimeInterval, titleActionAsIdentifier: [String]) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.badge = 1
        content.categoryIdentifier = "customIdentifier"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        var listAction: [UNNotificationAction] = []
        for item in titleActionAsIdentifier {
            listAction.append(UNNotificationAction(identifier: item, title: item, options: []))
        }
        
        let category = UNNotificationCategory(identifier: "customIdentifier", actions:listAction, intentIdentifiers: [], options: [])
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let current = UNUserNotificationCenter.current()
        current.setNotificationCategories([category])
        current.add(request, withCompletionHandler: nil)
    }
    
}
