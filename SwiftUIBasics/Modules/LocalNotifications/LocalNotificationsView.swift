//
//  LocalNotificationsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 11/01/25.
//

import SwiftUI
import UserNotifications

struct LocalNotificationsView: View {
    var body: some View {
        VStack {
            Button("Notification") {
                sendLocalNotification()
            }
        }
    }
    
    func sendLocalNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (_, _) in
            
        }
        
        // Content
        let content = UNMutableNotificationContent()
        content.title = "My title"
        content.subtitle = "My subtitle"
        content.body = "This is my first local notification with SwiftUI"
        content.sound = .defaultCritical
        content.badge = 1
        
        // Image
        if let path = Bundle.main.path(forResource: "cat", ofType: "jpeg") {
            let url = URL(fileURLWithPath: path)
            if let image = try? UNNotificationAttachment(identifier: "cat", url: url) {
                content.attachments = [image]
            }
        }
        
        // Buttons
        let buttonOne = UNNotificationAction(identifier: "notification.buton.one", title: "Open view", options: .foreground)
        let buttonTwo = UNNotificationAction(identifier: "notification.buton.two", title: "Cancel", options: .destructive)
        let category = UNNotificationCategory(identifier: "notification.category", actions: [buttonOne, buttonTwo], intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        content.categoryIdentifier = category.identifier
        
        // Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

#Preview {
    LocalNotificationsView()
}
