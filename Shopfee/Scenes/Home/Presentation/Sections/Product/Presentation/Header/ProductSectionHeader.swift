//
//  ProductSectionHeader.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 08/05/2024.
//

import SwiftUI

final class ProductSectionHeader: UICollectionViewCell {
    func configure<ViewModel: ProductSectionHeaderProtocol>(with viewModel: ViewModel) {
        contentConfiguration = UIHostingConfiguration {
            ProductSectionHeaderView(viewModel: viewModel)
        }
        .background(.neutralLight)
    }
}

private struct ProductSectionHeaderView<ViewModel: ProductSectionHeaderProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        DrinkTypePicker(items: viewModel.drinkTypes, selectedItem: $viewModel.selectedDrinkType)
    }
}

private struct DrinkTypePicker: View {
    let items: [String]
    @Binding var selectedItem: String
    
    @Namespace private var animation
    
    var body: some View {
        HStack {
            ForEach(items, id: \.self) { item in
                let isSelected = item == selectedItem
                
                itemView(item)
                    .padding(.bottom, 12)
                    .overlay(alignment: .bottom) {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.brand)
                                .frame(height: 2)
                                .matchedGeometryEffect(id: "Bottom", in: animation)
                        }
                    }
            }
        }
        .animation(.bouncy, value: selectedItem)
    }
    
    @ViewBuilder
    func itemView(_ item: String) -> some View {
        let isSelected = item == selectedItem
        Text(item)
            .frame(maxWidth: .infinity)
            .foregroundStyle(isSelected ? .brand : .textDisabled)
            .font(.custom(size: 16, weight: .medium))
            .onTapGesture {
                selectedItem = item
            }
    }
}

//#Preview {
//    DrinkTypePicker(items: )
//        .padding()
//}
