//
//  SplashViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import SwiftUI

final class SplashViewController: UIHostingController<SplashView> {
    init() {
        super.init(rootView: SplashView())
    }
    
    @MainActor 
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
