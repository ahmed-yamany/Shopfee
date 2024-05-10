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
        VStack {
            Text("Hello World!")
        }
    }
}
