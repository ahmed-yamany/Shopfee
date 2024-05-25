//
//  ReceiptView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import SwiftUI

struct ReceiptView<ViewModel: ReciptViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Hello World!")
        }
    }
}
