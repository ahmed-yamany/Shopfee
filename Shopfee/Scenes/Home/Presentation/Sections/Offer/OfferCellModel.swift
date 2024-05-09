//
//  OfferCellModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 05/05/2024.
//

import SwiftUI

public struct OfferCellModel: Identifiable {
    public var id = UUID()
    
    let background1: Color
    let background2: Color
    let title: String
    let discount: String
    let discountFor: String
    let discountType: String
}
