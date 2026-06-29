//
//  Product.swift
//  CartObserver
//
//  Created by Siddhatech on 29/06/26.
//

import Foundation

struct Product: Identifiable, Hashable {

    let id = UUID()
    let name: String
    let price: Double

}
