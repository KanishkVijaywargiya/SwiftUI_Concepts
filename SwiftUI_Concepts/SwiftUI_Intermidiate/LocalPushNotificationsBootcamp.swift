//
//  LocalPushNotificationsBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 27/02/22.
//

import SwiftUI
import CoreLocation

class NotificationManager { // singleton class
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Success")
            }
        }
    }
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my 1sst notification"
        content.subtitle = "This is soooo easy!!!"
        content.sound = .default
        content.badge = 1
        
        //time
        // let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //calendar
        // var dateComponents = DateComponents()
        // dateComponents.hour = 20
        // dateComponents.minute = 26
        // let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //location
        let coordinates = CLLocationCoordinate2D(
            latitude: 40.00,
            longitude: 50.00)
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let locationTrigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: locationTrigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    func CancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalPushNotificationsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                NotificationManager.instance.requestAuthorization()
            }) {
                Text("Request Permission")
            }
            Divider()
            Button(action: {
                NotificationManager.instance.scheduleNotification()
            }) {
                Text("Schedule Notification")
            }
            Divider()
            Button(action: {
                NotificationManager.instance.CancelNotification()
            }) {
                Text("Cancel Notification")
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalPushNotificationsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalPushNotificationsBootcamp()
    }
}
