
import SwiftUI
import CloudKit

class PushNotifciationViewModel: ObservableObject {
    func PermissionsReq() {
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        let predicate = NSPredicate(value: true)
        let notifications = CKSubscription.NotificationInfo()
        let sub = CKQuerySubscription(recordType: "photos", predicate: predicate, subscriptionID: "New_Items_Added", options: .firesOnRecordCreation)
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) {
            permissionsSuccess, PermissionsError in
            if let error = PermissionsError {
                print(error)
            } else if permissionsSuccess {
                print("permissions success 🥳")
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                    notifications.title = "New Places!!!! 🤩"
                    notifications.alertBody = "Come check Wijha and see the new places we added"
                    notifications.soundName = "default"
                    notifications.shouldBadge = false
                    sub.notificationInfo = notifications
                
                    CKContainer(identifier:"iCloud.MC2").publicCloudDatabase.save(sub) { returnedSubscription, returnedError in
                        if let error = returnedError {
                            print(error)
                        } else {
                            print("Successfully subscribed to notifications!")
                        }
                    }
                    
                }
            } else {
                print("permissions failed 😔")
            }
        }
    }
}

