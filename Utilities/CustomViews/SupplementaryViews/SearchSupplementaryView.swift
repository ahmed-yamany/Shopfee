//
//  SearchSupplementaryView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 09/05/2024.
//

import SwiftUI

class SearchSupplementaryView: UICollectionViewCell {
    func configure(with searchText: Binding<String>, placeholder: String) {
        contentConfiguration = UIHostingConfiguration {
            SearchView(text: searchText, placeholder: placeholder)
        }
        .background(.neutralLight)
        .margins(.horizontal, .safeAreaPadding)
    }
}

struct SearchView: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .frame(maxWidth: .infinity)
                .font(.custom(size: 12, weight: .regular))
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.textDisabled)
        }
        .frame(height: 40)
        .padding(.horizontal, 14)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1.5)
                .fill(.brand100)
        }
    }
}
