//
//  ReceiptEntity.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 25/05/2024.
//

import Foundation

struct ReceiptEntity: Identifiable, Hashable {
    let id: UUID
    let transactionId: String
    let date: String
    let time: String
    let products: [ReceiptProduct]
    let price: Double
    let voucher: Double
    let currency: String
    let paymentMethod: String
    let scheduledPickUp: String
    
    var totalPrice: Double {
        price + voucher
    }
    
    static let sample = ReceiptEntity(
        id: UUID(),
        transactionId: "D123456789ABC",
        date: "10 July’22",
        time: "04:13 PM",
        products: [
            .init(
                id: UUID(),
                name: "Coffee Milk",
                ingredients: "Ice, Regular, Normal Sugar, Normal Ice",
                count: 1
            )
        ],
        price: 25.0,
        voucher: 0.0,
        currency: "RP",
        paymentMethod: "GoPay",
        scheduledPickUp: "05.15 PM"
    )
}

struct ReceiptProduct: Identifiable, Hashable {
    let id: UUID
    let name: String
    let ingredients: String
    let count: Int
}
