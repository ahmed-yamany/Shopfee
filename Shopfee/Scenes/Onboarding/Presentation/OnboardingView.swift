//
//  OnboardingView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI
import FoundationExtensions
import SwiftUIViews

struct OnboardingView<ViewModel: OnboardingViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State var activeId: UUID?
    
    var body: some View {
        VStack {
            skipButton
            Spacer()
            
            if #available(iOS 17.0, *) {
                animatedSlider
            } else {
                tabView
            }
            
            Spacer()
            paginationView
        }
        .padding([.horizontal, .bottom], .safeAreaPadding)
        .applyPrimaryStyle(alignment: .top)
        .animation(.default, value: viewModel.selectedPageIndex)
        .animation(.default, value: activeId)
        .onAppear {
            viewModel.onAppear()
        }
        .onChange(of: activeId) { newValue in
            if let index = viewModel.tabViewModels.firstIndex(where: { $0.id == newValue }) {
                viewModel.selectedPageIndex = index
            } else {
                viewModel.selectedPageIndex = 0
            }
        }
        .onChange(of: viewModel.selectedPageIndex) { newValue in
            activeId = viewModel.tabViewModels[safe: newValue]?.id
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
            if #available(iOS 17.0, *) {
                tabViewImage(model)
                    .visualEffect { content, geometryProxy in
                        content
                            .offset(x: -(geometryProxy.bounds(of: .scrollView)?.minX ?? 0) * 0.7)
                    }
            } else {
             tabViewImage(model)
            }
            
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
    
    @ViewBuilder
    private func tabViewImage(_ model: OnboardingTabViewModel) -> some View {
        Image(model.imageResource)
            .resizable()
            .frame(width: 220, height: 220)
            .frame(maxWidth: .infinity)
    }
    
    @available(iOS 17.0, *)
    @ViewBuilder
    private var animatedSlider: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.tabViewModels) { tabViewModel in
                    tabViewItem(tabViewModel)
                        .tag(tabViewModel.id)
                        .containerRelativeFrame(.horizontal)
                        .transition(.move(edge: .trailing))
                }
            }
            .scrollTargetLayout() // adding paging
        }
        .padding(.horizontal, -.safeAreaPadding)
        .scrollIndicators(.never)
        .scrollTargetBehavior(.viewAligned)
        .scrollPosition(id: $activeId)
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
