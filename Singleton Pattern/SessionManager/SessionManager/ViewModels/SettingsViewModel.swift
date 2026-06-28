//
//  SettingsViewModel.swift
//  Singleton
//
//  Created by Siddhatech on 28/06/26.
//

import Foundation
import Combine

final class SettingsViewModel: ObservableObject {

    @Published var currentUser: User?
    @Published var isLoggedIn: Bool = false

    private let sessionManager = SessionManager.shared
    private var cancellables = Set<AnyCancellable>()

    init() {

        sessionManager.$currentUser
            .assign(to: &$currentUser)

        sessionManager.$isLoggedIn
            .assign(to: &$isLoggedIn)
    }

    func logout() {
        sessionManager.logout()
    }
}
