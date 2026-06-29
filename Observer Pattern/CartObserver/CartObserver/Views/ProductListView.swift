//
//  ProductListView.swift
//  CartObserver
//
//  Created by Rushi on 29/06/26.
//

import SwiftUI

struct ProductListView: View {

    @StateObject
    private var viewModel = ProductListViewModel()

    var body: some View {

        NavigationStack {

            List {

                ForEach(viewModel.availableProducts) { product in

                    VStack(alignment: .leading, spacing: 12) {

                        Text(product.name)
                            .font(.headline)

                        Text("₹\(product.price, specifier: "%.2f")")
                            .foregroundStyle(.secondary)

                        Button {

                            viewModel.addToCart(product)

                        } label: {

                            Label("Add To Cart", systemImage: "cart.badge.plus")

                        }
                        .buttonStyle(.borderedProminent)

                    }
                    .padding(.vertical, 8)

                }

            }
            .navigationTitle("Products")
            .toolbar {

                NavigationLink {

                    CartView()

                } label: {

                    ZStack(alignment: .topTrailing) {

                        Image(systemName: "cart")

                        if viewModel.cartItemCount > 0 {

                            Text("\(viewModel.cartItemCount)")
                                .font(.caption2)
                                .foregroundStyle(.white)
                                .padding(5)
                                .background(.red)
                                .clipShape(Circle())
                                .offset(x: 10, y: -10)

                        }

                    }

                }

            }

        }

    }
}

#Preview {
    ProductListView()
}
