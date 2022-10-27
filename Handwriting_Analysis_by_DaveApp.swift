//
//  Handwriting_Analysis_by_DaveApp.swift
//  Handwriting Analysis by Dave
//
//  Created by Ben Ashkenazi on 2/21/22.
//

import SwiftUI

@main
struct TestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
     
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
 
class AppDelegate: NSObject, UIApplicationDelegate {
         
    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely
 
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}


