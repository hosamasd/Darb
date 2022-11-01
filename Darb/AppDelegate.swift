//
//  AppDelegate.swift
//  PlayIT
//
//  Created by Bola Fayez on 04/01/2021.
//  Copyright © 2021 Bola Fayez. All rights reserved.
//

import UIKit
import SwiftUI
//import Firebase
//import IQKeyboardManager

//import GoogleMaps

class AppDelegate : NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
//        Thread.sleep(forTimeInterval: 100)
//        RunLoop.current.run(until: NSDate(timeIntervalSinceNow:0.1) as Date)
//        FirebaseApp.configure()
        
//        IQKeyboardManager.shared.enable = true
//        IQKeyboardManager.shared.enable = true
//        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
//        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
//        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysShow
        
        
//        CheckUpdate.shared.showUpdate(withConfirmation: true)
//        GMSServices.provideAPIKey("AIzaSyB94A14LWHvUM4a8_WhVcWLWP9Oe7nDLiY")
//
//        IQKeyboardManager.shared().isEnabled = true
//        IQKeyboardManager.shared().toolbarDoneBarButtonItemText = "Done"
//        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
//        IQKeyboardManager.shared().previousNextDisplayMode = .alwaysShow
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//         UserServices.shared.isOnline(state: false)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//         Messaging.messaging().shouldEstablishDirectChannel = false
//         UserServices.shared.isOnline(state: false)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//         UserServices.shared.isOnline(state: true)
//        connectToFirebase()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//        Messaging.messaging().shouldEstablishDirectChannel = false
    }
}


//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    @AppStorage("isBeignLanuch") var isBeignLanuch = false
//
//    var window: UIWindow?
//    let gcmMessageIDKey = "gcm.message_id"
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//
////        splash increase
////        Thread.sleep(forTimeInterval: 1)
//
//
//
////        FirebaseApp.configure()
//        registerForRemoteNotifications(for: application)
////        Messaging.messaging().delegate = self
//        isBeignLanuch=true
//
//        return true
//    }
//
//    func applicationWillResignActive(_ application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//        isBeignLanuch=true
//
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//        isBeignLanuch=true
//
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//        isBeignLanuch=true
//
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//        isBeignLanuch=true
//
//    }
//
//    func applicationWillTerminate(_ application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//        isBeignLanuch=true
//    }
//
//    // The callback to handle data message received via FCM for devices running iOS 10 or above.
////    func applicationReceivedRemoteMessage(_ remoteMessage: MessagingRemoteMessage) {
////        print(remoteMessage.appData)
////    }
//
//
//
//}
//
//
////register for notifications
//extension AppDelegate{
//
//    // [START set_messaging_delegate]
//    //    Messaging.messaging().delegate = self
//    // [END set_messaging_delegate]
//    // Register for remote notifications. This shows a permission dialog on first run, to
//    // show the dialog at a more appropriate time move this registration accordingly.
//    // [START register_for_notifications]
//    func registerForRemoteNotifications(for application : UIApplication) {
//        if #available(iOS 10.0, *) {
//            // For iOS 10 display notification (sent via APNS)
//            UNUserNotificationCenter.current().delegate = self
//
//
//            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//            UNUserNotificationCenter.current().requestAuthorization(
//                options: authOptions,
//                completionHandler: {_, _ in })
//        } else {
//            let settings: UIUserNotificationSettings =
//                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//            application.registerUserNotificationSettings(settings)
//        }
//        application.registerForRemoteNotifications()
//        //        UIApplication.shared.registerForRemoteNotifications()
//
//    }
//
//    // [START receive_message]
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
//        // If you are receiving a notification message while your app is in the background,
//        // this callback will not be fired till the user taps on the notification launching the application.
//        // TODO: Handle data of notification
//        // With swizzling disabled you must let Messaging know about the message, for Analytics
//        // Messaging.messaging().appDidReceiveMessage(userInfo)
//        // Print message ID.
//        if let messageID = userInfo[gcmMessageIDKey] {
//            print("Message ID: \(messageID)")
//        }
//
//        // Print full message.
//        print(userInfo)
//    }
//
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
//                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//        // If you are receiving a notification message while your app is in the background,
//        // this callback will not be fired till the user taps on the notification launching the application.
//        // TODO: Handle data of notification
//        // With swizzling disabled you must let Messaging know about the message, for Analytics
//        // Messaging.messaging().appDidReceiveMessage(userInfo)
//        // Print message ID.
//        if let messageID = userInfo[gcmMessageIDKey] {
//            print("Message ID: \(messageID)")
//        }
//
//        // Print full message.
//        print(userInfo)
//
//        completionHandler(UIBackgroundFetchResult.newData)
//    }
//    // [END receive_message]
//
//
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        print("Unable to register for remote notifications: \(error.localizedDescription)")
//    }
//
//    // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
//    // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
//    // the FCM registration token.
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        print("APNs token retrieved: \(deviceToken)")
//        // With swizzling disabled you must set the APNs token here.
//        // Messaging.messaging().apnsToken = deviceToken
//
//        //  Register.
//        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
//        print("deviceTokenString: \(deviceTokenString)")
//            //self.apnsToken = deviceTokenString
//
//        //set apns token in messaging
////        Messaging.messaging().apnsToken = deviceToken
////
////        //get FCM token
////        if let token = Messaging.messaging().fcmToken {
////            //self.fcmToken = token
////            UserDefaults.standard.set(token, forKey: DEVICEID)
////            print("FCM token: \(token)")
////        }
//
//    }
//
//
//}
//
//
//
//// [START ios_10_message_handling]
//@available(iOS 10, *)
//extension AppDelegate : UNUserNotificationCenterDelegate {
//
//    // Receive displayed notifications for iOS 10 devices.
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                willPresent notification: UNNotification,
//                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        let userInfo = notification.request.content.userInfo
//
//        // With swizzling disabled you must let Messaging know about the message, for Analytics
//        // Messaging.messaging().appDidReceiveMessage(userInfo)
//        // Print message ID.
//        if let messageID = userInfo[gcmMessageIDKey] {
//            print("Message ID: \(messageID)")
//        }
//
//        // Print full message.
//        print(userInfo)
//
//        // Change this to your preferred presentation option
//        completionHandler([.alert, .badge, .sound])
//    }
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                didReceive response: UNNotificationResponse,
//                                withCompletionHandler completionHandler: @escaping () -> Void) {
//        let userInfo = response.notification.request.content.userInfo
//        // Print message ID.
//        if let messageID = userInfo[gcmMessageIDKey] {
//            print("Message ID: \(messageID)")
//        }
//
//        // Print full message.
//        print(userInfo)
//
//        completionHandler()
//    }
//}
//// [END ios_10_message_handling]
//
////extension AppDelegate : MessagingDelegate {
////    // [START refresh_token]
////
////    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
////        print("Firebase registration token: \(fcmToken)")
////        let dataDict:[String: String] = ["token": fcmToken]
////        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
////        print("#Device: \(fcmToken)")
////        // TODO: If necessary send token to application server.
////    }
////
////
////    // [END refresh_token]
////    // [START ios_10_data_message]
////    // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
////    // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
////    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
////        print("Received data message: \(remoteMessage.appData)")
////    }
////    // [END ios_10_data_message]
////}
