//
//  PopUpView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 30/04/2024.
//

import SwiftUI

protocol PopUpItem {
    var image: Image { get }
    var title: String { get }
    var subTitle: String { get }
    var primaryButtonTitle: String { get }
    var secondaryButtonTitle: String { get }
}

struct PopUpView: View {
    let item: any PopUpItem
    let onPrimaryAction: Action
    let onSecondaryAction: Action
    
    init(_ item: any PopUpItem, onPrimaryAction: @escaping Action, onSecondaryAction: @escaping Action) {
        self.item = item
        self.onPrimaryAction = onPrimaryAction
        self.onSecondaryAction = onSecondaryAction
    }
    
    var body: some View {
        VStack(spacing: 24) {
            image
            description
            buttons
        }
        .padding(16)
        .frame(width: 280)
        .background(.neutralLight)
        .mask(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 10)
    }
    
    private var image: some View {
        item.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 168, height: 168)
    }
    
    private var description: some View {
        VStack(spacing: 8) {
            Text(item.title)
                .foregroundStyle(.textHeading)
                .font(.custom(size: 14, weight: .medium))
            
            Text(item.subTitle)
                .foregroundStyle(.textParagraph)
                .font(.custom(size: 12, weight: .regular))
                .multilineTextAlignment(.center)
        }
    }
    
    private var buttons: some View {
        HStack(spacing: 32) {
            Button(item.secondaryButtonTitle) {
                onSecondaryAction()
            }
            .buttonStyle(.secondary(size: .small))
            
            Button(item.primaryButtonTitle) {
                onPrimaryAction()
            }
            .buttonStyle(.primary(size: .small))
        }
    }
}

#Preview {
    PopUpView(
        OTPPopUpItem(phoneNumber: "0282765237"),
        onPrimaryAction: { },
        onSecondaryAction: {}
    )
}
