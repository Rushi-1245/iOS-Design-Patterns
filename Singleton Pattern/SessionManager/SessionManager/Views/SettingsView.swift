//
//  SettingsView.swift
//  Singleton
//
//  Created by Siddhatech on 28/06/26.
//

import SwiftUI

struct SettingsView: View {

    @StateObject
    private var viewModel = SettingsViewModel()

    var body: some View {

        Form {

            Section("Session Information") {

                HStack {

                    Text("Login Status")

                    Spacer()

                    Text(viewModel.isLoggedIn ? "Logged In" : "Logged Out")
                        .foregroundStyle(viewModel.isLoggedIn ? .green : .red)

                }

                if let user = viewModel.currentUser {

                    HStack {

                        Text("Name")

                        Spacer()

                        Text(user.name)

                    }

                    HStack {

                        Text("Email")

                        Spacer()

                        Text(user.email)

                    }

                }

            }

            Section {

                Button(role: .destructive) {

                    viewModel.logout()

                } label: {

                    Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                        .frame(maxWidth: .infinity)

                }

            }

        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
