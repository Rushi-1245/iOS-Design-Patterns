//
//  PaymentProcessing.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import Foundation

protocol PaymentMethod {

    var title: String { get }

    func processPayment(_ payment: Payment) -> PaymentStatus

}
