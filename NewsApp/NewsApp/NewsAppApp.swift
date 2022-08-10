//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import SwiftUI
import Firebase

@main
struct NewsAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainScreen(viewModel: .init())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    private func setupFirebase(application: UIApplication) {
        FirebaseApp.configure()

        UNUserNotificationCenter.current().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })

        Messaging.messaging().delegate = self
        application.registerForRemoteNotifications()
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupFirebase(application: application)
        return true
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {}
