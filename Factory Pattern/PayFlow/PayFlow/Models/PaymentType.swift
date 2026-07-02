//
//  PaymentType.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import Foundation


enum PaymentType: String, CaseIterable, Identifiable {

    case creditCard = "Credit Card"
    case upi = "UPI"
    case paypal = "PayPal"
    case applePay = "Apple Pay"

    var id: String {
        rawValue
    }

    var icon: String {
        switch self {
        case .creditCard:
            return "creditcard.fill"

        case .upi:
            return "iphone"

        case .paypal:
            return "p.circle.fill"

        case .applePay:
            return "apple.logo"
        }
    }

    var colorName: String {
        switch self {
        case .creditCard:
            return "Blue"

        case .upi:
            return "Green"

        case .paypal:
            return "Orange"

        case .applePay:
            return "Black"
        }
    }
}
