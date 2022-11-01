//
//  DarbApp.swift
//  Darb
//
//  Created by hosam on 31/10/2022.
//

import SwiftUI

@main
struct DarbApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)

        }
    }
}
