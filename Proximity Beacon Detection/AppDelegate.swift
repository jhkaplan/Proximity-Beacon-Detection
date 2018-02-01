//
//  AppDelegate.swift
//  Proximity Beacon Detection
//
//  Created by Josh Kaplan on 1/30/18.
//  Copyright © 2018 Josh Kaplan. All rights reserved.
//

import UIKit
import EstimoteProximitySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var proximityObserver: EPXProximityObserver!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let cloudCredentials = EPXCloudCredentials(appID: "proximity-beacon-detection-gmh",
                                                   appToken: "b26b46e50635c266cedacb2428f463b8")
        
        self.proximityObserver = EPXProximityObserver(
            credentials: cloudCredentials,
            errorBlock: { error in
                print("proximitiy observer error: \(error)")
        })
        
        let zone1 = EPXProximityZone(range: .far,
                                     attachmentKey: "floor", attachmentValue: "1st")
        zone1.onEnterAction = { attachment in
            print("Welcome to the 1st floor")
        }
        zone1.onExitAction = {
            attachment in
                print("Bye Bye, you are now leaving the 1st floor")
        }
        
        let zone2 = EPXProximityZone(range: .near,
                                     attachmentKey: "room", attachmentValue: "Office")
        zone2.onChangeAction = { attachments in
            print("Current Location: \(attachments.map { $0.payload["room"] })")
        }
        
        let zone3 = EPXProximityZone(range: .near,
                                     attachmentKey: "room", attachmentValue: "Kitchen")
        zone3.onChangeAction = { attachments in
            print("Current Location: \(attachments.map { $0.payload["room"] })")
        }
        
        let zone4 = EPXProximityZone(range: .near,
                                     attachmentKey: "room", attachmentValue: "Bedroom")
        zone4.onChangeAction = { attachments in
            print("Current Location: \(attachments.map { $0.payload["room"] })")
        }
        
        let zone5 = EPXProximityZone(range: .near,
                                     attachmentKey: "room", attachmentValue: "Bedroom")
        zone5.onChangeAction = { attachments in
            print("Current Location: \(attachments.map { $0.payload["room"] })")
        }
        
        let zone6 = EPXProximityZone(range: .near,
                                     attachmentKey: "room", attachmentValue: "Office-Blueberry")
        zone6.onChangeAction = { attachments in
            print("Current Location: \(attachments.map { $0.payload["room"] })")
        }
        
        let zone7 = EPXProximityZone(range: .near,
                                     attachmentKey: "room", attachmentValue: "Office-Blueberry")
        zone7.onChangeAction = { attachments in
            print("Current Location: \(attachments.map { $0.payload["room"] })")
        }
        
        
        self.proximityObserver.startObserving([zone1,zone2,zone3,zone4,zone5,zone6,zone7])
        // Override point for customization after application launch.
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


}

