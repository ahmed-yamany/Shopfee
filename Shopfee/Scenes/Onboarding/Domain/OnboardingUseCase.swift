//
//  OnboardingUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import Foundation

protocol OnboardingUseCaseProtocol: AnyActor {
    func getTabViewModels() async throws -> [OnboardingTabViewModel]
}

final actor OnboardingUseCase: OnboardingUseCaseProtocol {
    
    func getTabViewModels() throws -> [OnboardingTabViewModel] {
        [
            .init(
                imageResource: .onbaording1,
                title: "Choose and customize your Drinks",
                subtitle: "Customize your own drink exactly how you like it by adding any topping you like!!!"
            ),
            //  swiftlint: disable all
            .init(
                imageResource: .onbaording2,
                title: "Quickly and easly",
                subtitle: "You can place your order quickly and easly without wasting time. You can also schedule orders via your smarthphone."
            ),
            //  swiftlint: enable all
            .init(
                imageResource: .onbaording3,
                title: "Get and Redeem Voucher",
                subtitle: "Exciting prizes await you! Redeem yours by collecting all the points after purchase in the app!"
            )
        ]
    }
}
