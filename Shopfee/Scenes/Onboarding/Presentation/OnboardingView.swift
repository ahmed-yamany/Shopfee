//
//  OnboardingView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI

struct OnboardingView<ViewModel: OnboardingViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            skipButton
            tabView
            paginationView
        }
        .padding([.horizontal], .safeAreaPadding)
        .applyPrimaryStyle(alignment: .top)
        .animation(.default, value: viewModel.selectedPageIndex)
        .onAppear {
            viewModel.onAppear()
        }
    }
    
    private var skipButton: some View {
        Button("skip".localized) {
            viewModel.skip()
        }
        .buttonStyle(.ghost)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var tabView: some View {
        TabView(selection: $viewModel.selectedPageIndex) {
            ForEach(viewModel.tabViewModels.indices, id: \.self) { index in
                let tabViewModel = viewModel.tabViewModels[index]
                tabViewItem(tabViewModel)
                    .tag(index)
            }
        }
        .frame(height: CGFloat.screenSize.height * 0.65)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .padding(.horizontal, -.safeAreaPadding)
        .padding(.vertical, .safeAreaPadding)
        
    }
    
    @ViewBuilder
    private func tabViewItem(_ model: OnboardingTabViewModel) -> some View {
        VStack {
            Image(model.imageResource)
                .resizable()
                .frame(width: 220, height: 220)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(model.title)
                    .font(.custom(size: 20, weight: .bold))
                    .foregroundStyle(.textHeading)
                
                Text(model.subtitle)
                    .font(.custom(size: 16, weight: .medium))
                    .foregroundStyle(.textParagraph)
            }            
        }
        .padding(.safeAreaPadding)
    }
    
    private var paginationView: some View {
        HStack {
            PaginationView(count: 3, selectedIndex: viewModel.selectedPageIndex)
                .paginationStyle(.capsule)
                .paginationSelectTint(.brand)
                .paginationTint(.textDisabled)
            
            Spacer()
            
            nextButton
        }
    }
    
    private var nextButton: some View {
        Button {
            viewModel.next()
        } label: {
            HStack {
                Text(viewModel.isPaginationReachedEnd() ? "Login/Register".localized : "next".localized)
                Image(systemName: "arrow.right")
            }
        }
        .buttonStyle(.primary())
        .frame(width: 156)
    }
}

#Preview {
    let router = ShopfeeRouter(navigationController: .init())
    let coordinator = OnboardingCoordinator(router: router)
    let useCase = OnboardingUseCase()
    let viewModel = OnboardingViewModel(coordinator: coordinator, useCase: useCase)
    return OnboardingView(viewModel: viewModel)
}
