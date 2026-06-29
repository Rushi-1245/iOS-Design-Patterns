//
//  DashboardViewModel.swift
//  Singleton
//
//  Created by Rushi on 28/06/26.
//

import Foundation
import Combine

final class DashboardViewModel: ObservableObject {

    @Published var currentUser: User?

    private let sessionManager = SessionManager.shared
    private var cancellables = Set<AnyCancellable>()

    init() {
        sessionManager.$currentUser
            .assign(to: &$currentUser)
    }

    var welcomeMessage: String {
        guard let user = currentUser else {
            return "Welcome"
        }

        return "Welcome, \(user.name)"
    }

    func logout() {
        sessionManager.logout()
    }
}
