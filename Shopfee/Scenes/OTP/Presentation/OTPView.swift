//
//  OTPView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 29/04/2024.
//

import SwiftUI
import SwiftUIModifiers

struct OTPView<ViewModel: OTPViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .applyPrimaryStyle()
        .navigationTitle("Confirm OTP code")
    }
}

//#Preview {
//    OTPView()
//}
