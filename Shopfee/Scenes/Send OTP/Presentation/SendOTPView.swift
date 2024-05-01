//
//  SendOTPView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 01/05/2024.
//

import SwiftUI

struct SendOTPView<ViewModel: SendOTPViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ShopfeeLoadingView(
                title: "Please wait a minute,",
                subtitle: "we will send you the OTP code."
            )
        }
        .applyPrimaryStyle()
        .task {
            await viewModel.onAppear()
        }
    }
}
