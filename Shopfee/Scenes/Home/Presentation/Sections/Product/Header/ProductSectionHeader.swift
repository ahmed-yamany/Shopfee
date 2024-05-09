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
        .margins(.all, 0)
        .background(.neutralLight)
        
    }
}

private struct ProductSectionHeaderView<ViewModel: ProductSectionHeaderProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            DrinkTypePicker(items: viewModel.drinkTypes, selectedItem: $viewModel.selectedDrinkType)
            FilterPicker(items: viewModel.filterItems, selectedItems: $viewModel.selectedFilterTypes)
        }
        .padding(.top, .safeAreaPadding)
    }
}
