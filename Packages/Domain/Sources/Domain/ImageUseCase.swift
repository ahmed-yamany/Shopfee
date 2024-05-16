//
//  ImageUseCase.swift
//
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import UIKit

public protocol ImageUseCaseProtocol: AnyActor {
    func fetchImage(from urlString: String) async throws -> UIImage
}

public enum ImageErrors: Error, LocalizedError {
    case invalidUrl
    case invalidData
    
    // you can support localization here
    public var errorDescription: String? {
        switch self {
            case .invalidUrl:
                "image url is invalid"
            case .invalidData:
                "image data is invalid"
        }
    }
}

final public actor ImageUseCase: ImageUseCaseProtocol {
    let cash = NSCache<AnyObject, UIImage>()
    
    public init() {}
    
    public func fetchImage(from urlString: String) async throws -> UIImage {
        let url = try url(for: urlString)
        
        if let imageFromCash = cash.object(forKey: url as AnyObject) {
            return imageFromCash
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let image = try image(from: data)
        
        cash.setObject(image, forKey: url as AnyObject)
        return image
    }
    
    private func url(for string: String) throws -> URL {
        guard let url = URL(string: string) else {
            throw ImageErrors.invalidUrl
        }
        return url
    }
    
    private func image(from data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw ImageErrors.invalidData
        }
        return image
    }
}
