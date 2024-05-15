//
//  CheckoutView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 15/05/2024.
//

import SwiftUI

struct CheckoutView<ViewModel: CheckoutViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Hello World!")
        }
        .navigationTitle("Checkout")
    }
}
