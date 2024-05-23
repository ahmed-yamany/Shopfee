//
//  ShopFeeStepper.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import SwiftUI
import SwiftUIViews

struct ShopFeeStepper: StepperStyle {
    @ViewBuilder
    func makeBody(configurations: Configurations) -> some View {
        HStack {
            let atMinValue = configurations.minValue == configurations.value
            let atMaxValue = configurations.maxValue == configurations.value
            Button {
                configurations.onMinus()
            } label: {
                Image(systemName: "minus")
                    .font(.custom(size: 14, weight: .bold))
                    .foregroundStyle(atMinValue ? .textDisabled : .brand)
            }
            .disabled(atMinValue)
            .frame(width: 24)
            .frame(maxHeight: .infinity)
            .background {
                Rectangle()
                    .stroke(lineWidth: 1)
                    .fill(.textDisabled)
            }
            
            Text("\(configurations.value)")
                .foregroundStyle(.textHeading)
                .font(.custom(size: 12, weight: .medium))
            
            Button {
                configurations.onPlus()
            } label: {
                Image(systemName: "plus")
                    .font(.custom(size: 14, weight: .bold))
                    .foregroundStyle(atMaxValue ? .textDisabled : .brand)
            }
            .frame(width: 24)
            .disabled(atMaxValue)
            .frame(maxHeight: .infinity)
            .background {
                Rectangle()
                    .stroke(lineWidth: 1)
                    .fill(.textDisabled)
            }

        }
        .frame(height: 24)
        .mask {
            RoundedRectangle(cornerRadius: 4)
        }
        .background {
            RoundedRectangle(cornerRadius: 4)
                .stroke(lineWidth: 1)
                .fill(.textDisabled)
        }
    }
    
}

extension StepperStyle where Self == ShopFeeStepper {
    static var shopfee: Self {
        ShopFeeStepper()
    }
}
