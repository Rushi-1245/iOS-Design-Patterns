//
//  UPIPayment.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import Foundation

final class UPIPayment: PaymentMethod {

    var title: String {
        "UPI"
    }

    func processPayment(_ payment: Payment) -> PaymentStatus {

        let message = """
        📱 UPI Payment
        
        Verifying UPI ID...
        Payment of ₹\(Int(payment.amount)) completed successfully.
        """

        return .success(message)
    }
}
