//
//  OnboardingTabViewModel.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import Foundation

struct OnboardingTabViewModel: Identifiable {
    private(set) var id = UUID()
    
    let imageResource: ImageResource
    let title: String
    let subtitle: String
}
