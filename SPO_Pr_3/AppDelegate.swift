//
//  AppDelegate.swift
//  SPO_Pr_3
//
//  Created by Astemir Shibzuhov on 3/14/21.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    var main: NSWindowController!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let windowScene = NSStoryboard(name: "Main", bundle: nil).instantiateInitialController() as! NSWindowController
        main = windowScene
        main.window?.contentViewController = ViewController()
        main.window?.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

