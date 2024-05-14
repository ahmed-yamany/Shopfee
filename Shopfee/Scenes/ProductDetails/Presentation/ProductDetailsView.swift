//
//  ProductDetailsView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 10/05/2024.
//

import SwiftUI
import SwiftUIViews

struct ProductDetailsView<ViewModel: ProductDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State var offset: CGPoint = .zero
    
    var body: some View {
        if let entity = viewModel.entity {
            TrackableScrollView(offset: $offset) {
                VStack(spacing: 0) {
                    VStack {}
                        .frame(height: 240)
                    
                    content(entity: entity)
                }
                .padding(.bottom, 76)
            }
            .background(alignment: .top) {
                productImage
            }
            .navigationTitle("Customize Order")
            .applyPrimaryStyle()
            .overlay(alignment: .bottom) {
                CheckOutView(viewModel: viewModel, entity: entity)
            }
            
        } else {
            ShopFeeActivityIndicator()
        }
    }
    
    private var imageHeight: CGFloat {
        let height = 240 + offset.y
        let minValue = 240 * 0.75
        return height < minValue ? minValue : height
    }
    
    private var productImage: some View {
        Image(.productDetails)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: imageHeight)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 70)
            .background(.brand50)
    }
    
    private func content(entity: ProductDetailsEntity) -> some View {
        LazyVStack(spacing: 8) {
            DetailsView(viewModel: viewModel, entity: entity)
            
            CustomizeView(viewModel: viewModel, entity: entity)
            
            ToppingView(viewModel: viewModel, entity: entity)
        }
        .padding(.horizontal, .safeAreaPadding)
    }
}

private struct DetailsView<ViewModel: ProductDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    let entity: ProductDetailsEntity
    
    var body: some View {
        VStack(spacing: 4) {
            Text(entity.type)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.custom(size: 14, weight: .medium))
                .foregroundStyle(.brand)
            
            HStack {
                Text(entity.name)
                
                Spacer()
                
                Text("\(entity.currency)\(entity.price)")
            }
            .font(.custom(size: 18, weight: .medium))
            
            HStack {
                Text(entity.ingredients)
                    .font(.custom(size: 14, weight: .medium))
                    .foregroundStyle(.textParagraph)
                
                Spacer()
            }
            
            Button {
                viewModel.ratingAndReviewsTapped()
            } label: {
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundStyle(.warning)
                        
                        Text(entity.rating)
                            .font(.custom(size: 12, weight: .bold))
                    }
                    
                    Text("(\(entity.ratingCount)")
                        .font(.custom(size: 12, weight: .regular))
                    
                    Circle()
                        .frame(height: 4)
                    
                    Text("Ratings and reviews")
                        .font(.custom(size: 12, weight: .regular))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.brand)
                }
            }
        }
        .makeAsCard()
    }
}

private struct CustomizeView<ViewModel: ProductDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    let entity: ProductDetailsEntity
    
    var body: some View {
        VStack {
            Text("Customize")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.custom(size: 14, weight: .bold))
            
            Grid {
                ForEach(entity.customize) { item in
                    GridRow {
                        Text(item.title)
                            .font(.custom(size: 14, weight: .regular))
                            .gridColumnAlignment(.leading)
                        
                        Spacer()
                        
                        FilterPicker(
                            items: item.pickerItems,
                            selectedItems: $viewModel.customizeItems,
                            multiSelect: false
                        )
                        .gridColumnAlignment(.trailing)
                    }
                }
            }
            
        }
        .makeAsCard()
    }
}

private struct ToppingView<ViewModel: ProductDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    let entity: ProductDetailsEntity
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Topping")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.custom(size: 14, weight: .bold))
            
            Grid(verticalSpacing: 12) {
                ForEach(entity.extras) { extra in
                    let selected = viewModel.extraItems.contains(where: { $0 == extra })
                    GridRow {
                        Text(extra.title)
                            .font(.custom(size: 14, weight: .regular))
                            .gridColumnAlignment(.leading)
                        
                        Spacer()
                        
                        HStack {
                            Text(extra.priceString)
                                .font(.custom(size: 14, weight: .medium))
                            
                            Image(systemName: selected ? "checkmark.square.fill" : "square")
                                .foregroundStyle(selected ? .success : .textHeading)
                        }
                        .gridColumnAlignment(.trailing)
                    }
                    .onTapGesture {
                        viewModel.addOrDeleteExtra(extra)
                    }
                }
            }
        }
        .makeAsCard()
    }
}
    
private struct CheckOutView<ViewModel: ProductDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    let entity: ProductDetailsEntity
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Total")
                    .foregroundStyle(.textParagraph)
                    .font(.custom(size: 14, weight: .medium))
                
                Text("\(entity.currency). \(viewModel.totalPrice())")
                    .foregroundStyle(.textHeading)
                    .font(.custom(size: 18, weight: .bold))
            }
            
            Spacer()
            
            Button("Add Order") {
                viewModel.addOrder()
            }
            .buttonStyle(.primary())
            .frame(width: 132)
        }
        .frame(height: 66)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, .safeAreaPadding)
        .background {
            Color.neutralLight
                .shadow(color: .textHeading.opacity(0.5), radius: 3)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    let router = ShopfeeRouter(navigationController: .init())
    let coordinator = ProductDetailsCoordinator(router: router,
                                                product: .sample,
                                                onAppear: {})
    let useCase = ProductDetailsUseCase(product: .sample)
    let viewModel = ProductDetailsViewModel(
        coordinator: coordinator,
        useCase: useCase
    )
    let controller = ProductDetailsViewController(viewModel: viewModel)
    router.setViewController(controller)
    return router.navigationController.toSwiftUI().ignoresSafeArea().eraseToAnyView()
}
