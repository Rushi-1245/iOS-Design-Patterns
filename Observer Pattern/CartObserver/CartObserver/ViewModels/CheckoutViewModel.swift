//
//  CheckoutViewModel.swift
//  CartObserver
//
//  Created by Siddhatech on 29/06/26.
//

import Foundation
import Combine

final class CheckoutViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var totalItems: Int = 0
    @Published var totalPrice: Double = 0

    // MARK: - Properties

    private let cartManager = CartManager.shared
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initializer

    init() {
        observeCart()
    }

    // MARK: - Private Methods

    private func observeCart() {

        cartManager.$cartItems
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in

                self?.totalItems = products.count
                self?.totalPrice = products.reduce(0) { $0 + $1.price }

            }
            .store(in: &cancellables)
    }

    // MARK: - Public Methods

    func placeOrder() {

        guard totalItems > 0 else { return }

        cartManager.clearCart()
    }
}
