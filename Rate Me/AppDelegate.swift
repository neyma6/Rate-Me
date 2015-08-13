//
//  AppDelegate.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 20/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //var slideOut = SlideOutController(centerViewController: LoginController())
        var user = User(userId: "t@t.com")
        user.name = "John Snow"
        user.password = "1"
        user.facebookUser = false
        user.numberOfRates = 124
        user.rateValue = 450
        user.imageUrl = "http://lh3.googleusercontent.com/VxBIQjnEgYbpq-kmvws3o_jpci3NYWj57vFuoKTRQF_1zavY6InfBZ1PKCoc-N6l5ltvO4AhNCFZDdYEpV5sGC4"
        
        var controller = SlideOutController(currentUser: user, profilePicture: nil)
        
        //var controller = UploadImageController()
        
        window?.rootViewController = controller
        window?.backgroundColor = UIColor.clearColor()
        
        application.statusBarHidden = true
        /*let gradientMain = GradientColor(firstGradient: "#DBDDDE", secondGradient: "#898C90")
        var backgroundLayerMain = gradientMain.gl
        backgroundLayerMain.frame = UIScreen.mainScreen().bounds
        window?.layer.insertSublayer(backgroundLayerMain, atIndex: 0)*/
        
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

