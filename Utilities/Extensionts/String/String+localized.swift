//
//  String+localized.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import Foundation

public extension String {
    var localized: String {
        String(localized: LocalizationValue(self), table: "Shopfee")
    }
}
