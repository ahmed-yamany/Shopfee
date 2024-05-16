import Foundation
import CoreData

public enum ContextManagerError<ManagedObject: NSManagedObject>: Error, LocalizedError {
    case fetchById
    case count
    case fetchAll
    case createObject
    case fetchRequest
 
    public var errorDescription: String? {
        switch self {
            case .fetchById:
                return "Failed to fetch object by id"
            case .count:
                return "Failed to get all count"
            case .fetchAll:
                return "Failed to fetch all objects"
            case .createObject:
                return "Failed to Create new object"
            case .fetchRequest:
                return "Failed to create new fetch request"
        }
    }
}
