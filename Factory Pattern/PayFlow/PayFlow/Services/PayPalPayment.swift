//
//  PayPalPayment.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import Foundation

final class PayPalPayment: PaymentMethod {

    var title: String {
        "PayPal"
    }

    func processPayment(_ payment: Payment) -> PaymentStatus {

        let message = """
        🌍 PayPal Payment
        
        Redirecting to PayPal...
        Payment of ₹\(Int(payment.amount)) completed successfully.
        """

        return .success(message)
    }
}
