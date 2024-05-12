//
//  OfferDecorationView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 05/05/2024.
//

import SwiftUI
import SwiftUIViews

private class Pagination: ObservableObject {
    @Published var count: Int = 0
    @Published var selectedIndex: Int = 0
}

public class PaginationSupplementaryView: UICollectionViewCell {
    private let pagination = Pagination()

    public func setCount(_ count: Int) {
        self.pagination.count = count
        contentConfiguration = UIHostingConfiguration {
            SupplementaryView(pagination: pagination)
        }
    }
    
    public func updateIndex(to index: Int) {
        pagination.selectedIndex = index
    }
}

private struct SupplementaryView: View {
    @ObservedObject var pagination: Pagination
    
    var body: some View {
        PaginationView(count: pagination.count, selectedIndex: pagination.selectedIndex)
            .paginationStyle(.capsule)
            .paginationSelectTint(.brand)
            .paginationTint(.neutralMediam)
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
}
