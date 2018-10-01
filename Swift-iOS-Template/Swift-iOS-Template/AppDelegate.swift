//
//  AppDelegate.swift
//  Swift-iOS-Template
//
//  Created by Cong Nguyen on 28/09/2018.
//  Copyright © 2018 Cong Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var leftVC : LeftSliderViewController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.registerNotification()
        self.checkUserAuthentication()
        application.isStatusBarHidden = false
        application.statusBarStyle = .lightContent

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    @objc func checkUserAuthentication() {
       
        if  Utility.isCheckAuthentication() {

            window?.rootViewController = nil
            let unifiedController = UnifiedTabBarViewController()
            leftVC = LeftSliderViewController()
            leftVC.delegate = unifiedController
            let sideMenuController = LGSideMenuController(rootViewController: unifiedController, leftViewController: leftVC, rightViewController: nil)
            sideMenuController.leftViewWidth = Constants.LEFT_SLIDER_VIEW_WIDTH
            sideMenuController.leftViewPresentationStyle = .slideAbove
            sideMenuController.delegate = leftVC
            sideMenuController.isLeftViewSwipeGestureEnabled = false
            window?.rootViewController = sideMenuController
            self.window?.makeKeyAndVisible()

        } else {
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
            let loginVC = LoginViewController();
            let navigationVC = UINavigationController(rootViewController: loginVC)
            self.window?.rootViewController = navigationVC;
            self.window?.makeKeyAndVisible()

        }
    }
    func registerNotification() {
        
        let notificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(notificationSettings)
        UIApplication.shared.registerForRemoteNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(self.checkUserAuthentication), name: NSNotification.Name(rawValue: AUTHENTICATION_CHANGE), object: nil)
        
    }

}

