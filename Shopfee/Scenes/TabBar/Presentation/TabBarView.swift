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
                VStack(spacing: 8) {
                    if !viewModel.cart.isEmpty {
                        CardView(viewModel: viewModel)
                            .transition(.move(edge: .bottom))
                    }

                    BarView(viewModel: viewModel)
                }
                .transition(.move(edge: .bottom))
            }
        }
        .onAppear {
            UITabBar.appearance().isHidden = true
        }
        .animation(.easeInOut, value: viewModel.showTabBar)
        .animation(.easeInOut, value: viewModel.cart)
    }
}

private struct CardView<ViewModel: TabBarViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(viewModel.cart.count) items")
                    .font(.custom(size: 14, weight: .medium))

                Text(viewModel.cart.last?.name ?? "")
                    .font(.custom(size: 12, weight: .regular))
            }

            Spacer()

            HStack {
                Text(viewModel.cartTotalPrice())
                Image(systemName: "bag")
            }
            .font(.custom(size: 16, weight: .medium))
        }
        .padding(.safeAreaPadding)
        .foregroundStyle(.neutralLight)
        .frame(height: 56)
        .frame(maxWidth: .infinity)
        .background(.brand)
        .mask {
            RoundedRectangle(cornerRadius: 16)
        }
        .padding(.horizontal, .safeAreaPadding)
    }
}

private struct BarView<ViewModel: TabBarViewModelProtocol>: View {
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

private struct BarItemView<ViewModel: TabBarViewModelProtocol>: View {
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
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .foregroundStyle(isSelected ? .brand : .textDisabled)
        }
    }
}
