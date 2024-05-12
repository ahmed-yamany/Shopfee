//
//  ProductDetailsView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI

struct ProductDetailsView<ViewModel: ProductDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Hello World!")
            }
        }
        .navigationTitle("Customize Order")
        .frame(maxWidth: .infinity)
        .background(.brand200)
        .applyPrimaryStyle()
    }
}
