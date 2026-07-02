//
//  PaymentViewModel.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import Combine
import Foundation

final class PaymentViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var amount: String = ""
    @Published var selectedPaymentType: PaymentType = .creditCard
    @Published var paymentStatus: PaymentStatus?
    @Published var paymentHistory: [Payment] = []
    @Published var isProcessing = false

    // MARK: - Computed Properties

    var isPayButtonEnabled: Bool {

        guard let amount = Double(amount) else {
            return false
        }

        return amount > 0
    }

    // MARK: - Public Methods

    func payNow() {

        guard let amount = Double(amount) else { return }

        isProcessing = true

        let payment = Payment(
            amount: amount,
            paymentType: selectedPaymentType,
            date: Date()
        )

        let processor = PaymentFactory.makePaymentMethod(for: selectedPaymentType)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {

            self.paymentStatus = processor.processPayment(payment)
            self.paymentHistory.insert(payment, at: 0)

            self.amount = ""
            self.isProcessing = false

        }

    }

}
