//
//  CartManager.swift
//  CartObserver
//
//  Created by Siddhatech on 29/06/26.
//

import Foundation
import Combine

final class CartManager: ObservableObject {

    // MARK: - Singleton

    static let shared = CartManager()

    // MARK: - Published Properties

    @Published private(set) var cartItems: [Product] = []

    // MARK: - Initializer

    private init() {}

    // MARK: - Computed Properties

    var totalItems: Int {
        cartItems.count
    }

    var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.price }
    }

    // MARK: - Cart Operations

    func addProduct(_ product: Product) {
        cartItems.append(product)
    }

    func removeProduct(_ product: Product) {
        cartItems.removeAll { $0.id == product.id }
    }

    func clearCart() {
        cartItems.removeAll()
    }
}
