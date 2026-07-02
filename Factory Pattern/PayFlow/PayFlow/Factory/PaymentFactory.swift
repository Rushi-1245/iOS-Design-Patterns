//
//  PaymentFactory.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import Foundation

struct PaymentFactory {

    static func makePaymentMethod(for paymentType: PaymentType) -> PaymentMethod {

        switch paymentType {

        case .creditCard:
            return CreditCardPayment()

        case .upi:
            return UPIPayment()

        case .paypal:
            return PayPalPayment()

        case .applePay:
            return ApplePayPayment()

        }

    }

}
