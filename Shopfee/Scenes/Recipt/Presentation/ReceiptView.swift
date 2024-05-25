//
//  ReceiptView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 23/05/2024.
//

import SwiftUI
import SwiftUIModifiers

struct ReceiptView<ViewModel: ReceiptViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                content(.sample)
            }
            .padding(.safeAreaPadding)
        }
        .navigationTitle("Receipt Order")
        .applyPrimaryStyle()
    }
    
    @ViewBuilder
    private func content(_ entity: ReceiptEntity) -> some View {
        VStack(spacing: 20) {
            SuccessView()
            
            VStack(spacing: 8) {
                Text("Thank You!")
                    .font(.custom(size: 18, weight: .bold))
                
                Text("Your transaction was successful")
                    .font(.custom(size: 14, weight: .medium))
                    .foregroundStyle(.textParagraph)
            }
            
            VStack(spacing: 12) {
                transaction(title: "ID Transaction", value: entity.transactionId)
                transaction(title: "Date", value: entity.date)
                transaction(title: "Time", value: entity.time)
            }
            
            divider
            
            VStack(spacing: 8) {
                transaction(title: "Item", value: "")
                
                ForEach(entity.products) { product in
                    ReceiptProductView(product: product)
                }
            }
            
            VStack(spacing: 8) {
                Text("Payment Summary")
                    .font(.custom(size: 14, weight: .medium))
                    .foregroundStyle(.textHeading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    HStack {
                        Text("Price")
                        Spacer()
                        Text("\(entity.currency)\(entity.price)")
                    }
                    
                    HStack {
                        Text("Voucher")
                        Spacer()
                        Text("\(entity.voucher)")
                    }
                    
                    HStack {
                        Text("Total")
                        Spacer()
                        Text("\(entity.currency)\(entity.totalPrice)")
                            
                    }
                    .font(.custom(size: 14, weight: .medium))
                    .foregroundStyle(.textHeading)
                }
                .font(.custom(size: 14, weight: .regular))
                .foregroundStyle(.textParagraph)
            }
            
            VStack(spacing: 16) {
                transaction(title: "Payment Method", value: entity.paymentMethod)
                transaction(title: "Schedule Pick Up", value: entity.scheduledPickUp)
            }
            
            Button("Done") {
                viewModel.done()
            }
            .buttonStyle(.primary())
            .frame(width: 160)
        }
        .padding(.horizontal, 8)
        .offset(y: -40)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1)
                .fill(.brand50)
        }
        .padding(.top, 28)
        .foregroundStyle(.textHeading)
    }
    
    @ViewBuilder
    private func transaction(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.custom(size: 14, weight: .medium))
                .foregroundStyle(.textHeading)
            Spacer()
            Text(value)
                .font(.custom(size: 14, weight: .regular))
                .foregroundStyle(.textParagraph)
        }
    }
    
    private var divider: some View {
        Rectangle()
            .fill(.brand50)
            .padding(.horizontal, -8)
            .frame(height: 1)
    }
}

private struct SuccessView: View {
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "checkmark")
                .resizable()
            Image(systemName: "minus")
                .resizable()
                .frame(height: 3)
        }
        .foregroundStyle(.neutralLight)
        .aspectRatio(contentMode: .fit)
        .frame(width: 24, height: 20)
        .frame(width: 60, height: 60)
        .background(Circle().fill(.success))
        .padding(8)
        .background(Circle().fill(.success.opacity(0.2)))
    }
}

private struct ReceiptProductView: View {
    let product: ReceiptProduct
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(product.name)
                Spacer()
                Text("\(product.count)X")
            }
            .font(.custom(size: 14, weight: .medium))
            .foregroundStyle(.textHeading)
            
            Text(product.ingredients)
                .font(.custom(size: 12, weight: .regular))
                .foregroundStyle(.textParagraph)
        }
    }
}

#Preview {
    let coordinator = ReceiptCoordinator(router: .init(navigationController: .init()))
    coordinator.start()
    return coordinator
        .router
        .navigationController
        .toSwiftUI()
        .eraseToAnyView()
        .ignoresSafeArea()
}
