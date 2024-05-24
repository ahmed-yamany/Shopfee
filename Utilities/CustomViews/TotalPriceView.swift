//
//  TotalPriceView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import SwiftUI

struct TotalPriceView: View {
    let totalPrice: String
    let buttonTitle: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Total")
                    .foregroundStyle(.textParagraph)
                    .font(.custom(size: 14, weight: .medium))
                
                Text(totalPrice)
                    .foregroundStyle(.textHeading)
                    .font(.custom(size: 18, weight: .bold))
            }
            
            Spacer()
            
            Button(buttonTitle) {
                action()
            }
            .buttonStyle(.primary())
            .frame(width: 132)
        }
        .frame(height: 66)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, .safeAreaPadding)
        .background {
            Color.neutralLight
                .shadow(color: .textHeading.opacity(0.5), radius: 3)
                .ignoresSafeArea()
        }
    }
}
