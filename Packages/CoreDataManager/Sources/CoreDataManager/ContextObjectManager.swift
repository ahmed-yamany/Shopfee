import CoreData
import Foundation

open class ContextObjectManager<Object: NSManagedObject> {
    public let context: NSManagedObjectContext

    public init(context: NSManagedObjectContext) {
        self.context = context
    }

    /// Performs a block of code on the managed object context.
    ///
    /// - Parameters:
    ///   - schedule: The schedule type for performing the task on the context. Default is immediate.
    ///   - block: The block of code to be performed.
    /// - Throws: Errors that occur within the block.
    /// - Returns: The result of the block execution.
    public func perform<T>(
        schedule: NSManagedObjectContext.ScheduledTaskType = .immediate,
        _ block: @escaping () throws -> T
    ) async rethrows -> T {
        try await context.perform(schedule: schedule, block)
    }

    /// Saves changes made in the managed object context.
    public func save() async throws {
        guard context.hasChanges else {
            return
        }

        try await perform { [weak self] in
            guard let self = self else {
                return
            }

            try context.save()
        }
    }

    /// Creates a new instance of the managed object type associated with the manager.
    ///
    /// - Returns: A new instance of the managed object.
    public func newObject() async throws -> Object {
        try await perform { [weak self] in
            guard let self = self else {
                throw ContextManagerError<Object>.createObject
            }

            guard let object = NSManagedObject(entity: Object.entity(), insertInto: context) as? Object else {
                throw ContextManagerError<Object>.createObject
            }

            return object
        }
    }

    /// Fetches an object by its managed object ID.
    ///
    /// - Parameter id: The managed object ID of the object to fetch.
    /// - Returns: The fetched object, if found.
    public func fetchById(_ id: NSManagedObjectID) async throws -> Object? {
        try await perform { [weak self] in
            guard let self = self else {
                throw ContextManagerError<Object>.fetchById
            }

            return try context.existingObject(with: id) as? Object
        }
    }

    /// Creates a fetch request for the managed object type associated with the manager.
    ///
    /// - Parameters:
    ///   - sortKeyPath: The key path to sort the results by.
    ///   - fetchLimit: The maximum number of objects to fetch. Default is nil.
    ///   - fetchOffset: The starting index from which to fetch objects. Default is 0.
    ///   - sortAscending: A boolean value indicating whether to sort the results in ascending order. Default is true.
    /// - Returns: A fetch request instance.
    public func fetchRequest<SortType: Any>(
        sortBy sortKeyPath: KeyPath<Object, SortType>,
        fetchLimit: Int? = nil,
        fetchOffset: Int = 0,
        sortAscending: Bool = true
    ) throws -> NSFetchRequest<Object> {
        guard let request: NSFetchRequest<Object> = Object.fetchRequest() as? NSFetchRequest<Object> else {
            throw ContextManagerError<Object>.fetchRequest
        }

        if let fetchLimit = fetchLimit {
            request.fetchLimit = fetchLimit
            request.fetchOffset = fetchOffset
        }

        let sort = NSSortDescriptor(key: sortKeyPath.stringValue, ascending: sortAscending)
        request.sortDescriptors = [sort]
        return request
    }

    /// Counts the total number of objects of the managed object type associated with the manager.
    ///
    /// - Returns: The total count of objects.
    public func count() async throws -> Int {
        return try await perform { [weak self] in
            guard let self = self else {
                throw ContextManagerError<Object>.count
            }

            let request = try fetchRequest(
                sortBy: \.objectID,
                fetchLimit: nil,
                fetchOffset: 0,
                sortAscending: true
            )

            request.resultType = .countResultType
            return try context.count(for: request)
        }
    }

    /// Fetches all objects of the managed object type associated with the manager.
    ///
    /// - Parameters:
    ///   - sortKeyPath: The key path to sort the results by.
    ///   - fetchLimit: The maximum number of objects to fetch. Default is nil.
    ///   - fetchOffset: The starting index from which to fetch objects. Default is 0.
    ///   - sortAscending: A boolean value indicating whether to sort the results in ascending order. Default is true.
    /// - Returns: An array of fetched objects.
    open func fetchAll<SortType: Any>(
        sortBy sortKeyPath: KeyPath<Object, SortType>,
        fetchLimit: Int? = nil,
        fetchOffset: Int = 0,
        sortAscending: Bool = true
    ) async throws -> [Object] {
        return try await perform { [weak self] in
            guard let self = self else {
                throw ContextManagerError<Object>.fetchAll
            }

            let request = try fetchRequest(
                sortBy: sortKeyPath,
                fetchLimit: fetchLimit,
                fetchOffset: fetchOffset,
                sortAscending: sortAscending
            )

            return try context.fetch(request)
        }
    }

    /// Fetches objects of the managed object type associated with the manager based on a predicate.
    ///
    /// - Parameters:
    ///   - keyPath: The key path to match against.
    ///   - value: The value to match against the key path.
    ///   - sortKeyPath: The key path to sort the results by.
    ///   - predicateFormat: The format string for the predicate.
    ///   - fetchLimit: The maximum number of objects to fetch. Default is nil.
    ///   - fetchOffset: The starting index from which to fetch objects. Default is 0.
    ///   - sortAscending: A boolean value indicating whether to sort the results in ascending order. Default is true.
    /// - Returns: An array of fetched objects.

    open func fetch<ValueType: CustomStringConvertible, SortType: Any>(
        by keyPath: KeyPath<Object, ValueType>,
        value: ValueType,
        sortBy sortKeyPath: KeyPath<Object, SortType>,
        predicateFormat: String,
        fetchLimit: Int? = nil,
        fetchOffset: Int = 0,
        sortAscending: Bool = true
    ) async throws -> [Object] {
        return try await perform { [weak self] in
            guard let self = self else {
                throw ContextManagerError<Object>.fetchRequest
            }

            let request = try fetchRequest(
                sortBy: sortKeyPath,
                fetchLimit: fetchLimit,
                fetchOffset: fetchOffset,
                sortAscending: sortAscending
            )

            request.predicate = NSPredicate(format: predicateFormat, value.description)
            return try context.fetch(request)
        }
    }

    /// Fetches objects of the managed object type associated with the manager based on a key path and value.
    ///
    /// - Parameters:
    ///   - keyPath: The key path to match against.
    ///   - value: The value to match against the key path.
    ///   - sortKeyPath: The key path to sort the results by.
    ///   - fetchLimit: The maximum number of objects to fetch. Default is nil.
    ///   - fetchOffset: The starting index from which to fetch objects. Default is 0.
    ///   - sortAscending: A boolean value indicating whether to sort the results in ascending order. Default is true.
    /// - Returns: An array of fetched objects.
    open func fetchItems<ValueType: CustomStringConvertible, SortType: Any>(
        by keyPath: KeyPath<Object, ValueType>,
        value: ValueType,
        sortBy sortKeyPath: KeyPath<Object, SortType>,
        fetchLimit: Int? = nil,
        fetchOffset: Int = 0,
        sortAscending: Bool = true
    ) async throws -> [Object] {
        try await fetch(
            by: keyPath,
            value: value,
            sortBy: sortKeyPath,
            predicateFormat: "\(keyPath.stringValue) == %@",
            fetchLimit: fetchLimit,
            fetchOffset: fetchOffset,
            sortAscending: sortAscending
        )
    }

    /// Fetches objects of the managed object type associated with the manager based on a key path and a value containing the specified substring.
    ///
    /// - Parameters:
    ///   - keyPath: The key path to match against.
    ///   - value: The substring value to match against the key path.
    ///   - sortKeyPath: The key path to sort the results by.
    ///   - fetchLimit: The maximum number of objects to fetch. Default is nil.
    ///   - fetchOffset: The starting index from which to fetch objects. Default is 0.
    ///   - sortAscending: A boolean value indicating whether to sort the results in ascending order. Default is true.
    /// - Returns: An array of fetched objects.
    open func fetchItems<ValueType: CustomStringConvertible, SortType: Any>(
        by keyPath: KeyPath<Object, ValueType>,
        contains value: ValueType,
        sortBy sortKeyPath: KeyPath<Object, SortType>,
        fetchLimit: Int? = nil,
        fetchOffset: Int = 0,
        sortAscending: Bool = true
    ) async throws -> [Object] {
        try await fetch(
            by: keyPath,
            value: value,
            sortBy: sortKeyPath,
            predicateFormat: "\(keyPath.stringValue) contains[cd] %@",
            fetchLimit: fetchLimit,
            fetchOffset: fetchOffset,
            sortAscending: sortAscending
        )
    }

    /// Fetches a single object of the managed object type associated with the manager based on a key path and value.
    ///
    /// - Parameters:
    ///   - keyPath: The key path to match against.
    ///   - value: The value to match against the key path.
    /// - Returns: The fetched object, if found.
    open func fetchItem<ValueType: CustomStringConvertible>(by keyPath: KeyPath<Object, ValueType>, value: ValueType) async throws -> Object? {
        try await fetchItems(by: keyPath, value: value, sortBy: \.objectID).first
    }

    /// Deletes an object from the managed object context without save.
    ///
    /// - Parameter object: The object to be deleted.
    open func delete(_ object: Object) async throws {
        await perform { [weak self] in
            self?.context.delete(object)
        }
    }
    
    /// Deletes all objects from the managed object context without save
    open func deleteAll() async throws {
        for object in try await fetchAll(sortBy: \.objectID) {
            try await delete(object)
        }
    }
}

// MARK: - Fetch Items -

public extension ContextObjectManager {
}

extension KeyPath {
    var stringValue: String {
        NSExpression(forKeyPath: self).keyPath
    }
}
