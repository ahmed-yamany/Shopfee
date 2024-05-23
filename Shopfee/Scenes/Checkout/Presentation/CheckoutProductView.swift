//
//  CheckoutProductView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import SwiftUI
import SwiftUIViews

struct CheckoutProductView: View {
    let product: CartEntity
    
    @State var productCount: Int = 1
    
    var body: some View {
        HStack {
            productImage(Image(uiImage: product.image))
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.name)
                        .font(.custom(size: 14, weight: .medium))
                        .foregroundStyle(.textHeading)
                    
                    Text(product.ingredients)
                        .font(.custom(size: 12, weight: .regular))
                        .foregroundStyle(.textParagraph)
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "square.and.pencil")
                                .font(.custom(size: 12, weight: .medium))
                            
                            Text("Edit")
                                .font(.custom(size: 12, weight: .medium))
                        }
                    }
                    .foregroundStyle(.textHeading)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(product.currency). \(product.totalPrice)")
                        .font(.custom(size: 14, weight: .medium))
                        .foregroundStyle(.textHeading)
                    
                    Spacer()
                    
                    Stepper(value: $productCount, minValue: 1, maxValue: 10)
                        .stepperStyle(.shopfee)
                }
            }
            
            Spacer()
        }
        .onAppear {
            productCount = product.count
        }
    }
    
    private func productImage(_ image: Image) -> some View {
        Circle()
            .fill(.neutralMediam)
            .frame(height: 66)
            .overlay(alignment: .bottom) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 66, height: 66)
            }
    }
}

#Preview {
    CheckoutProductView(product: CartEntity(product: .sample, customize: [], extra: [], count: 1))
        .padding()
}
