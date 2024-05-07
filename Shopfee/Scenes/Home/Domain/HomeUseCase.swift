//
//  HomeUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 02/05/2024.
//

import UIKit
import Domain

protocol HomeUseCaseProtocol: AnyActor {
    func fetchImage(from urlString: String) async throws -> UIImage
}

final actor HomeUseCase: HomeUseCaseProtocol {
    let imageUseCase: ImageUseCaseProtocol
    
    init(imageUseCase: ImageUseCaseProtocol) {
        self.imageUseCase = imageUseCase
    }
    
    func fetchImage(from urlString: String) async throws -> UIImage {
        try await imageUseCase.fetchImage(from: urlString)
    }
}
