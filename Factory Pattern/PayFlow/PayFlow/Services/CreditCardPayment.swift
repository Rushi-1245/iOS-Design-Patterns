//
//  CardPayment.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import Foundation

final class CreditCardPayment: PaymentMethod {

    var title: String {
        "Credit Card"
    }

    func processPayment(_ payment: Payment) -> PaymentStatus {

        let message = """
        💳 Credit Card Payment
        
        Validating card details...
        Payment of ₹\(Int(payment.amount)) completed successfully.
        """

        return .success(message)
    }
}
