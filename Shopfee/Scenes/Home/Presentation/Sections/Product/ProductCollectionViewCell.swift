//
//  ProductCollectionViewCell.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 06/05/2024.
//

import SwiftUI

class ProductCollectionViewCell: UICollectionViewCell {
    func configure(with product: ProductCellModel) {
        contentConfiguration = UIHostingConfiguration {
            ProductView(product: product)
        }
    }
}

private struct ProductView: View {
    @ObservedObject var product: ProductCellModel
    
    var body: some View {
        HStack(spacing: 8) {
            image
            information
            Spacer()
            price
        }
        .frame(height: 85)
    }
    
    private var image: some View {
        Circle()
            .fill(.neutralMediam)
            .frame(height: 66)
            .overlay(alignment: .bottom) {
                Image(uiImage: product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 66, height: 66)
            }
            .overlay(alignment: .bottom) {
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(.warning)
                    
                    Text("4.9")
                        .foregroundStyle(.textHeading)
                        .font(.custom(size: 12, weight: .bold))
                }
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background {
                    Capsule()
                        .fill(Color.neutralLight)
                }
            }
    }
    
    private var information: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.custom(size: 14, weight: .medium))
            
            Text(product.ingredients)
                .font(.custom(size: 12, weight: .medium))
        }
        .foregroundStyle(.textParagraph)
    }
    
    private var price: some View {
        VStack {
            Text(product.price)
                .font(.custom(size: 14, weight: .medium))
                .foregroundStyle(.textHeading)
            
            Text(product.discountPrice)
                .strikethrough()
                .foregroundStyle(.textParagraph)
                .font(.custom(size: 12, weight: .regular))
        }
    }
}
