//
//  ApplePayPayment.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import Foundation

final class ApplePayPayment: PaymentMethod {

    var title: String {
        "Apple Pay"
    }

    func processPayment(_ payment: Payment) -> PaymentStatus {

        let message = """
        🍎 Apple Pay
        
        Authenticating with Face ID...
        Payment of ₹\(Int(payment.amount)) completed successfully.
        """

        return .success(message)
    }
}
