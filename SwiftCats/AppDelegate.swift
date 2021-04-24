//
//  AppDelegate.swift
//  SwiftCats
//
//  Created by Yilei He on 3/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var owners = Owners()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupAppDate()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    /// Setup application's data.
    private func setupAppDate() {
        
        // TODO: use REAL data when done.
        guard let data = TestData.catsAndOwners.data(using: .utf8) else {
            print("WARNING > setupAppViewModel > data not available")
            return
        }
        guard let owners = try? JSONDecoder().decode(Owners.self, from: data) else {
            print("WARNING > setupAppViewModel > invalid data")
            return
        }
        self.owners = owners
    }
    
    
}

