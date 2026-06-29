//
//  CheckoutView.swift
//  CartObserver
//
//  Created by Siddhatech on 29/06/26.
//

import SwiftUI

struct CheckoutView: View {

    @StateObject
    private var viewModel = CheckoutViewModel()

    var body: some View {

        VStack(spacing: 30) {

            Image(systemName: "creditcard.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.green)

            VStack(spacing: 16) {

                HStack {

                    Text("Total Items")

                    Spacer()

                    Text("\(viewModel.totalItems)")

                }

                HStack {

                    Text("Total Amount")

                    Spacer()

                    Text("₹\(viewModel.totalPrice, specifier: "%.2f")")

                }

            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            Button {

                viewModel.placeOrder()

            } label: {

                Text("Place Order")
                    .frame(maxWidth: .infinity)
                    .padding()

            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.totalItems == 0)

            Spacer()

        }
        .padding()
        .navigationTitle("Checkout")
    }
}

#Preview {
    NavigationStack {
        CheckoutView()
    }
}
