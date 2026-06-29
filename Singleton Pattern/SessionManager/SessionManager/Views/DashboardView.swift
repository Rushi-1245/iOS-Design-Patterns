//
//  DashboardView.swift
//  Singleton
//
//  Created by Rushi on 28/06/26.
//

import SwiftUI

struct DashboardView: View {

    @StateObject
    private var viewModel = DashboardViewModel()

    var body: some View {

        NavigationStack {

            VStack(spacing: 24) {

                Image(systemName: "person.crop.circle.badge.checkmark")
                    .font(.system(size: 90))
                    .foregroundStyle(.green)

                Text(viewModel.welcomeMessage)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                if let user = viewModel.currentUser {

                    VStack(alignment: .leading, spacing: 10) {

                        Label(user.name, systemImage: "person.fill")

                        Label(user.email, systemImage: "envelope.fill")

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                }

                NavigationLink {

                    ProfileView()

                } label: {

                    Label("Profile", systemImage: "person")

                        .frame(maxWidth: .infinity)
                        .padding()

                }
                .buttonStyle(.borderedProminent)

                NavigationLink {

                    SettingsView()

                } label: {

                    Label("Settings", systemImage: "gear")

                        .frame(maxWidth: .infinity)
                        .padding()

                }
                .buttonStyle(.bordered)

                Button(role: .destructive) {

                    viewModel.logout()

                } label: {

                    Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                        .frame(maxWidth: .infinity)
                        .padding()

                }

                Spacer()

            }
            .padding()
            .navigationTitle("Dashboard")
        }
    }
}

#Preview {
    DashboardView()
}
