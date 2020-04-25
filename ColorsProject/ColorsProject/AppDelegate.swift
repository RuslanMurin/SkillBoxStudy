//
//  AppDelegate.swift
//  ColorsProject
//
//  Created by Ruslan Murin on 17.04.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

enum ColorPallete: Int {
    case green
    case blue
    case red
// Color cases
    var rgb: UIColor {
            switch rawValue {
            case 0:
                return .green
            case 1:
                return .blue
            case 2:
                return .red
            default:
                return .black
            }
        }
// UIColor values
    var selectedDescription: String {
        switch rgb {
        case .green:
            return "Green color selected"
        case .blue:
            return "Blue color selected"
        case .red:
            return "Red color selected"
        default:
            return ""
        }
    }
// Descriptions based on UIColor values

    // add more computed property if needed
}
