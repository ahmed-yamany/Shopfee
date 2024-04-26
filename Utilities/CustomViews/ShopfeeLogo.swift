//
//  ShopfeeLogo.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI

struct ShopfeeLogo: View {
    var body: some View {
        HStack {
            Image(.shopfee)
                .resizable()
                .frame(width: 92, height: 92)
            
            VStack(alignment: .leading) {
                ShopFeeText()
                    .font(.custom(size: 32, weight: .bold))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Let us make your day!".localized)
                        .foregroundStyle(.textHeading)
                        .font(.custom(size: 12, weight: .medium))
                    
                    Rectangle()
                        .frame(height: 3)
                        .foregroundStyle(.brand)
                }
            }
        }
        .frame(width: 240)
    }
}

#Preview {
    ShopfeeLogo()
}
