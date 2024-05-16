//
//  ShopfeePersistentContainer.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 16/05/2024.
//

import Foundation
import CoreData

extension LoggingCategories {
    var coreData: String { "Core Data"}
}

struct ShopfeePersistentContainerCommand: SceneDelegateCommand {
    func execute() {
        ShopfeePersistentContainer.shared.loadStores()
    }
}

class ShopfeePersistentContainer: NSPersistentContainer {
    static let shared = ShopfeePersistentContainer()
    
    convenience private init() {
        self.init(name: "Shopfee")
    }
    
    /*
     Typical reasons for an error here include:
     * The parent directory does not exist, cannot be created, or disallows writing.
     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
     * The device is out of space.
     * The store could not be migrated to the current model version.
     Check the error message to determine what the actual problem was.
     */
    func loadStores() {
        loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                Logger.log("Unresolved error \(error), \(error.userInfo)", category: \.coreData, level: .fault)
            } else {
                Logger.log("Core Data Loaded Successfully", category: \.coreData, level: .info)
            }
        })
    }
}
