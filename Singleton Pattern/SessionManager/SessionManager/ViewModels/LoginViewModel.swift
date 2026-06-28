//
//  LoginViewModel.swift
//  Singleton
//
//  Created by Siddhatech on 28/06/26.
//

import Combine
import Foundation

final class LoginViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var email: String = ""

    private let sessionManager = SessionManager.shared

    var isLoginEnabled: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty &&
        !email.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func login() {
        sessionManager.login(name: name, email: email)
    }
}
