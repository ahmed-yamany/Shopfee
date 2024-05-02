//
//  ProcessAccountView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import SwiftUI

struct ProcessAccountView<ViewModel: ProcessAccountViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ShopfeeLoadingView(
                title: "Please wait a minute,",
                subtitle: "We are processing your account"
            )
        }
        .applyPrimaryStyle()
        .task {
            await viewModel.onAppear()
        }

    }
}
