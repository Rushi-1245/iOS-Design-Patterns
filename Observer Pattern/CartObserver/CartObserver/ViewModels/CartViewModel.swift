//
//  CartViewModel.swift
//  CartObserver
//
//  Created by Rushi on 29/06/26.
//

import Foundation
import Combine

final class CartViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var cartItems: [Product] = []
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

                self?.cartItems = products
                self?.totalPrice = products.reduce(0) { $0 + $1.price }

            }
            .store(in: &cancellables)
    }

    // MARK: - Public Methods

    func removeProduct(_ product: Product) {
        cartManager.removeProduct(product)
    }

    func clearCart() {
        cartManager.clearCart()
    }
}
