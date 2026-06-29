//
//  SessionManager.swift
//  Singleton
//
//  Created by Rushi on 28/06/26.
//

import Combine

final class SessionManager: ObservableObject {

    // MARK: - Singleton

    static let shared = SessionManager()

    // MARK: - Published Properties

    @Published private(set) var currentUser: User?
    @Published private(set) var isLoggedIn: Bool = false

    // MARK: - Initializer

    private init() { }

    // MARK: - Login

    func login(name: String, email: String) {
        currentUser = User(name: name, email: email)
        isLoggedIn = true
    }

    // MARK: - Logout

    func logout() {
        currentUser = nil
        isLoggedIn = false
    }

    // MARK: - Update Profile

    func updateProfile(name: String, email: String) {
        guard isLoggedIn else { return }

        currentUser = User(name: name, email: email)
    }
}
