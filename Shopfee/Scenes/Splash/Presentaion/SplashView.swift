//
//  SplashView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI

@MainActor
struct SplashView: View {
    @State private var showAnimatedView = false
    
    var body: some View {
        VStack {
            ShopfeeLogo()
        }
        .applyPrimaryStyle()
        .overlay {
            if showAnimatedView {
                animatedView
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(2))
            showAnimatedView = true
        }
        .animation(.interpolatingSpring(duration: 1), value: showAnimatedView)
    }
    
    private var animatedView: some View {
        VStack { }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.brand)
        .mask(RoundedRectangle(cornerRadius: 16))
        .ignoresSafeArea()
        .transition(.move(edge: .top))
    }
}

#Preview {
    SplashView()
}
