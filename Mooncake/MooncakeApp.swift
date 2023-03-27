//
//  MooncakeApp.swift
//  Mooncake
//
//  Created by Kunal Valrani on 2/6/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct MooncakeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionService = SessionServiceImpl()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch sessionService.state {
                    case .loggedIn:
                        HomeView()
                            .environmentObject(sessionService)
                    case .loggedOut:
                        LoginView()
                    }
                
            }
        }
    }
}
