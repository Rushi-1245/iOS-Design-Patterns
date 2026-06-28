//
//  LoginView.swift
//  Singleton
//
//  Created by Siddhatech on 28/06/26.
//

import SwiftUI

struct LoginView: View {

    @StateObject
    private var viewModel = LoginViewModel()

    var body: some View {

        NavigationStack {

            VStack(spacing: 24) {

                Spacer()

                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(.blue)

                Text("Session Manager")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Singleton Pattern")
                    .foregroundStyle(.secondary)

                VStack(spacing: 16) {

                    TextField("Enter Name", text: $viewModel.name)
                        .textFieldStyle(.roundedBorder)

                    TextField("Enter Email", text: $viewModel.email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)

                }

                Button {

                    viewModel.login()

                } label: {

                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()

                }
                .buttonStyle(.borderedProminent)
                .disabled(!viewModel.isLoginEnabled)

                Spacer()

            }
            .padding()
            .navigationTitle("Login")
        }
    }
}

#Preview {
    LoginView()
}
