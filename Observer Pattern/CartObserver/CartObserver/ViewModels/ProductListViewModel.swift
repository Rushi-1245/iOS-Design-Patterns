//
//  ProductListViewModel.swift
//  CartObserver
//
//  Created by Rushi on 29/06/26.
//

import Foundation
import Combine

final class ProductListViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var availableProducts: [Product] = [
        Product(name: "iPhone 16 Pro", price: 99999),
        Product(name: "MacBook Air M4", price: 129999),
        Product(name: "AirPods Pro", price: 24999),
        Product(name: "Apple Watch Series 10", price: 45999),
        Product(name: "iPad Air", price: 69999)
    ]

    @Published var cartItemCount: Int = 0

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
                self?.cartItemCount = products.count
            }
            .store(in: &cancellables)
    }

    // MARK: - Public Methods

    func addToCart(_ product: Product) {
        cartManager.addProduct(product)
    }
}
