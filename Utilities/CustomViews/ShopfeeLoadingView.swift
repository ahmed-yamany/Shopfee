//
//  LoadingView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 01/05/2024.
//

import SwiftUI

struct ShopfeeLoadingView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack {
            ShopFeeActivityIndicator()
            
            VStack(spacing: 0) {
                Text(title)
                    .font(.custom(size: 14, weight: .medium))
                
                Text(subtitle)
                    .font(.custom(size: 14, weight: .regular))
            }
        }
        .foregroundStyle(.textHeading)
        .multilineTextAlignment(.center)
        .padding(.safeAreaPadding)
    }
}

#Preview {
    ShopfeeLoadingView(
        title: "Please wait a minute,",
        subtitle: "we will send you the OTP code."
    )
}
