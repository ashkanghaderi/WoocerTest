//
//  AppDelegate.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupApplication()
        return true
    }
    
    private func setupApplication() {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        Application.shared.configureMainInterface(window)
        self.window = window
    }

}

