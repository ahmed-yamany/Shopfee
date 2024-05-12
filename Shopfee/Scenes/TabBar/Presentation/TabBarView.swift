//
//  TabBarView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import SwiftUI

struct TabBarView<ViewModel: TabBarViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selectedItem) {
                ForEach(viewModel.items, id: \.type) { item in
                    item.view.tag(item.type)
                }
            }
            
            if viewModel.showTabBar {
                BarView(viewModel: viewModel)
                    .transition(.move(edge: .bottom))
            }
        }
        .onAppear {
            UITabBar.appearance().isHidden = true
        }
        .animation(.easeInOut, value: viewModel.showTabBar)
    }
}

struct BarView<ViewModel: TabBarViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            ForEach(viewModel.items, id: \.type) { item in
                BarItemView(item: item, viewModel: viewModel)
            }
        }
        .background(.ultraThinMaterial)
    }
}

struct BarItemView<ViewModel: TabBarViewModelProtocol>: View {
    let item: any TabBarItem
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        let isSelected = item.type == viewModel.selectedItem
        Button {
            viewModel.selectedItem = item.type
        } label: {
            VStack {
                VStack(spacing: 4) {
                    if isSelected {
                        item.onSelectedImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)

                    } else {
                        item.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)

                    }
                    
                    Text(item.title)
                        .font(.custom(size: 10, weight: .medium))
                }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .foregroundStyle(isSelected ? .brand : .textDisabled)
        }
    }
}
