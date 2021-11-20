//
//  AppDelegate.swift
//  CoCo
//
//  Created by Minkyu Lee on 2021/07/15.
//

import UIKit
import CoreData
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("CoCo start !!!")
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIHostingController(rootView: ContentView(viewRouter: ViewRouter()))
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        if let rootVC = window?.rootViewController as? ViewController {
            rootVC.container = persistentContainer
        }
        return true
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
}

