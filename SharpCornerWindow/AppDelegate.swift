//
//  AppDelegate.swift
//  SharpCornerWindow
//
//  Created by user on 2025/08/26.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let sharpCornerWindow = SharpCornerWindow(contentViewController: .init())
        sharpCornerWindow.title = "SharpCornerWindow"

        let normalWindow = NSWindow(contentViewController: .init())
        normalWindow.setFrameOrigin(.init(
            x: sharpCornerWindow.frame.origin.x + sharpCornerWindow.frame.width + 20,
            y: sharpCornerWindow.frame.origin.y
        ))
        normalWindow.title = "NSWindow"
        
        normalWindow.makeKeyAndOrderFront(nil)
        sharpCornerWindow.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

