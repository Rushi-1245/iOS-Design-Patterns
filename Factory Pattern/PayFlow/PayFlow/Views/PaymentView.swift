//
//  PaymentView.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import SwiftUI

struct PaymentView: View {

    @StateObject private var viewModel = PaymentViewModel()

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 24) {

                    paymentDetailsSection

                    paymentMethodSection

                    payButton

                    processingSection

                    paymentResultSection

                    paymentHistorySection

                }
                .padding()

            }
            .navigationTitle("PayFlow")

        }

    }

}

// MARK: - UI Components

private extension PaymentView {

    var paymentDetailsSection: some View {

        VStack(alignment: .leading, spacing: 10) {

            Text("Payment Amount")
                .font(.headline)

            TextField("Enter Amount",
                      text: $viewModel.amount)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

        }

    }

    var paymentMethodSection: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Choose Payment Method")
                .font(.headline)

            ForEach(PaymentType.allCases) { paymentType in

                Button {

                    viewModel.selectedPaymentType = paymentType

                } label: {

                    HStack {

                        Image(systemName: paymentType.icon)
                            .font(.title3)

                        Text(paymentType.rawValue)

                        Spacer()

                        if paymentType == viewModel.selectedPaymentType {

                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.green)

                        }

                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                }
                .buttonStyle(.plain)

            }

        }

    }

    var payButton: some View {

        Button {

            viewModel.payNow()

        } label: {

            Text("Pay Now")
                .frame(maxWidth: .infinity)
                .padding()

        }
        .buttonStyle(.borderedProminent)
        .disabled(!viewModel.isPayButtonEnabled || viewModel.isProcessing)

    }

    @ViewBuilder
    var processingSection: some View {

        if viewModel.isProcessing {

            ProgressView("Processing Payment...")
                .padding()

        }

    }

    @ViewBuilder
    var paymentResultSection: some View {

        if let status = viewModel.paymentStatus {

            VStack(alignment: .leading, spacing: 12) {

                Text("Payment Status")
                    .font(.headline)

                switch status {

                case .success(let message):

                    Label(message,
                          systemImage: "checkmark.circle.fill")
                    .foregroundStyle(.green)

                case .failed(let message):

                    Label(message,
                          systemImage: "xmark.circle.fill")
                    .foregroundStyle(.red)

                }

            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

        }

    }

    @ViewBuilder
    var paymentHistorySection: some View {

        if !viewModel.paymentHistory.isEmpty {

            VStack(alignment: .leading, spacing: 16) {

                Text("Payment History")
                    .font(.headline)

                ForEach(viewModel.paymentHistory) { payment in

                    HStack {

                        VStack(alignment: .leading) {

                            Text(payment.paymentType.rawValue)
                                .fontWeight(.semibold)

                            Text(payment.date.formatted())
                                .font(.caption)
                                .foregroundStyle(.secondary)

                        }

                        Spacer()

                        Text("₹\(payment.amount, specifier: "%.2f")")
                            .fontWeight(.bold)

                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                }

            }

        }

    }

}

#Preview {
    PaymentView()
}
