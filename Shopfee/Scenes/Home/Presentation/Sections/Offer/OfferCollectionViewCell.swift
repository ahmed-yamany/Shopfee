//
//  OfferCollectionViewCell.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 05/05/2024.
//

import SwiftUI

public final class OfferCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with offer: OfferCellModel) {
        contentConfiguration = UIHostingConfiguration {
            OfferView(offer: offer)
        }
        .background {
            OfferBackgroundView(offer: offer)
        }
    }
}

private struct OfferView: View {
    let offer: OfferCellModel

    var body: some View {
        VStack(alignment: .trailing) {
            VStack(alignment: .leading) {
                Text(offer.title)
                    .font(.custom(size: 14, weight: .medium))
                
                Text(offer.discount)
                    .font(.custom(size: 30, weight: .bold))
            }
            
            VStack(alignment: .leading) {
                Text(offer.discountFor)
                    .font(.custom(size: 14, weight: .medium))
                
                Text(offer.discountType)
                    .font(.custom(size: 10, weight: .medium))
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .foregroundStyle(.brand)
    }
}

private struct OfferBackgroundView: View {
    let offer: OfferCellModel
    
    var body: some View {
        Rectangle()
            .fill(offer.background1)
            .overlay {
                OfferShape()
                    .fill(offer.background2)
            }
            .mask(RoundedRectangle(cornerRadius: 16))
    }
}

private struct OfferShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: .zero)
        path.closeSubpath()
        return path
    }
}
