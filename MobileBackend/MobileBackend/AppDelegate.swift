//
//  AppDelegate.swift
//  MobileBackend
//
//  Created by Nick Reichard on 8/22/24.
//

import Firebase
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Launching App...")
        FirebaseApp.configure()
        
        return true
    }
}
