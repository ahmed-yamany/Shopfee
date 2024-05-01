//
//  RegisterUseCase.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 27/04/2024.
//

import Foundation

protocol RegisterUseCaseProtocol: AnyActor {
    func registerUser(withName name: String, andPhoneNumber phoneNumber: String) async throws
}

final actor RegisterUseCase: RegisterUseCaseProtocol {
    func registerUser(withName name: String, andPhoneNumber phoneNumber: String) async throws {
        
    }
}
