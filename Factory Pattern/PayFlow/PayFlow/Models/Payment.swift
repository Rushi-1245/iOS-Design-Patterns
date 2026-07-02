//
//  PaymentMethod.swift
//  PayFlow
//
//  Created by Rushi on 30/06/26.
//

import Foundation


struct Payment: Identifiable {

    let id = UUID()

    let amount: Double

    let paymentType: PaymentType

    let date: Date

}
