//
//  CartView.swift
//  CartObserver
//
//  Created by Siddhatech on 29/06/26.
//

import SwiftUI

struct CartView: View {

    @StateObject
    private var viewModel = CartViewModel()

    var body: some View {

        VStack {

            if viewModel.cartItems.isEmpty {

                ContentUnavailableView(
                    "Cart is Empty",
                    systemImage: "cart",
                    description: Text("Add some products to continue.")
                )

            } else {

                List {

                    ForEach(viewModel.cartItems) { product in

                        VStack(alignment: .leading, spacing: 8) {

                            Text(product.name)
                                .font(.headline)

                            Text("₹\(product.price, specifier: "%.2f")")

                            Button(role: .destructive) {

                                viewModel.removeProduct(product)

                            } label: {

                                Label("Remove", systemImage: "trash")

                            }

                        }
                        .padding(.vertical, 8)

                    }

                    Section {

                        HStack {

                            Text("Total")

                            Spacer()

                            Text("₹\(viewModel.totalPrice, specifier: "%.2f")")
                                .fontWeight(.bold)

                        }

                    }

                }

            }

        }
        .navigationTitle("Cart")
        .toolbar {

            ToolbarItemGroup(placement: .topBarTrailing) {

                NavigationLink {

                    CheckoutView()

                } label: {

                    Text("Checkout")

                }

                if !viewModel.cartItems.isEmpty {

                    Button("Clear") {

                        viewModel.clearCart()

                    }

                }

            }

        }

    }
}

#Preview {
    NavigationStack {
        CartView()
    }
}
