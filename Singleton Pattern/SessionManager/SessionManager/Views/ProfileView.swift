//
//  ProfileView.swift
//  Singleton
//
//  Created by Siddhatech on 28/06/26.
//

import SwiftUI

struct ProfileView: View {

    @StateObject
    private var viewModel = ProfileViewModel()

    @Environment(\.dismiss)
    private var dismiss

    var body: some View {

        Form {

            Section("Profile Information") {

                TextField("Name", text: $viewModel.name)

                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)

            }

            Section {

                Button {

                    viewModel.saveProfile()
                    dismiss()

                } label: {

                    Text("Save Changes")
                        .frame(maxWidth: .infinity)

                }

                .buttonStyle(.borderedProminent)

            }

        }
        .navigationTitle("Profile")
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
