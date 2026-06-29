//
//  ProfileViewModel.swift
//  Singleton
//
//  Created by Rushi on 28/06/26.
//

import Combine

final class ProfileViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var email: String = ""

    private let sessionManager = SessionManager.shared
    private var cancellables = Set<AnyCancellable>()

    init() {
        sessionManager.$currentUser
            .sink { [weak self] user in
                self?.name = user?.name ?? ""
                self?.email = user?.email ?? ""
            }
            .store(in: &cancellables)
    }

    func saveProfile() {
        sessionManager.updateProfile(
            name: name,
            email: email
        )
    }
}
