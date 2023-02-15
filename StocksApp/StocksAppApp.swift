//
//  StocksAppApp.swift
//  StocksApp
//
//  Created by Andrei Avram on 08.02.2023.
//

import SwiftUI
import FirebaseCore
import SDWebImage
import SDWebImageSVGCoder

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
        return true
    }
}

@main
struct StocksAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
