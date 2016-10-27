//
//  AppDelegate.swift
//  UrlNavigation
//
//  Created by Gerrit Menzel on 27.10.16.
//  Copyright © 2016 geme. All rights reserved.
//

import UIKit

fileprivate
let appScheme = "urlnavigation://"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {

        window?.rootViewController = UINavigationController(rootViewController: RedViewController())
        window?.makeKeyAndVisible()

        UIApplication.open(scheme: "green?title=foobar")

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

        navigationController?.navigate(to: url, lookupTable: SchemeLookupTable())

        return true
    }
}

extension UIApplication {
    static func open(scheme: String) {
        var scheme = scheme

        if !scheme.hasPrefix(appScheme) {
            scheme = appScheme + scheme
        }

        if let url = URL(string: scheme) {
            UIApplication.open(url: url)
        }
    }
}

extension AppDelegate {

    var navigationController: UINavigationController? {
        return window?.rootViewController as? UINavigationController
    }
    
}

