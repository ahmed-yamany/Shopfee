//
//  ShopFeeActivityIndicator.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 13/05/2024.
//

import SwiftUI
import SwiftUIViews

struct ShopFeeActivityIndicator: View {
    // swiftlint: disable all
    let url = Bundle.main.url(forResource: "loading", withExtension: "gif")!
    // swiftlint: enable all
    
    var body: some View {
        GifView(url)
            .frame(width: 200, height: 120)
            .mask {
                RoundedRectangle(cornerRadius: 16)
            }
    }
}

#Preview {
    ShopFeeActivityIndicator()
}
