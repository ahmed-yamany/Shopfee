//
//  ShopFeeText.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI

struct ShopFeeText: View {
    var shop: AttributedString {
          var result = AttributedString("Shop")
        result.foregroundColor = .brand
          return result
      }

      var fee: AttributedString {
          var result = AttributedString("fee")
          result.foregroundColor = .brand500
          return result
      }
    
    var body: some View {
        Text(shop + fee)
    }
}

#Preview {
    ShopFeeText()
        .font(.largeTitle)
}
