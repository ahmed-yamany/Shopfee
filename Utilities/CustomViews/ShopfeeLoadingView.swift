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
    
    // swiftlint: disable all
    let url = Bundle.main.url(forResource: "loading", withExtension: "gif")!
    // swiftlint: enable all
    
    var body: some View {
        VStack {
            GifView(url)
                .frame(width: 400, height: 120)
            
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
