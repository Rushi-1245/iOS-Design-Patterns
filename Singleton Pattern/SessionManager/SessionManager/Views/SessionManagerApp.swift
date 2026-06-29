//
//  SessionManagerApp.swift
//  SessionManager
//
//  Created by Rushi on 28/06/26.
//

import SwiftUI

@main
struct SessionManagerApp: App {
    @StateObject private var sessionManager = SessionManager.shared

        var body: some Scene {
            WindowGroup {

                if sessionManager.isLoggedIn {
                    DashboardView()
                } else {
                    LoginView()
                }
            }
        }
}
