import Foundation
import os
// swiftlint:disable all
public final class LoggingCategories {
    public static let shared = LoggingCategories()
    public var `default`: String { "Default" }
}

@available(iOS 14.0, *)
/// The Logging protocol defines a standardized way of logging messages in an application or system.
public protocol Logging {
    func log(_ message: String,
             category: KeyPath<LoggingCategories, String>,
             level: OSLogType,
             file: StaticString,
             function: StaticString,
             line: UInt)
}
@available(iOS 14.0, *)
public class SystemLogger: Logging {
    public func log(_ message: String,
             category: KeyPath<LoggingCategories, String>,
             level: OSLogType,
             file: StaticString,
             function: StaticString,
             line: UInt) {
        let logMessage = "\(file) - \(function) - \(line): \(message)"
        let categoryString = LoggingCategories.shared[keyPath: category]
        let bundleID = Bundle.main.bundleIdentifier ?? ""
        os.Logger(subsystem: "\(bundleID).Logger", category: categoryString).log(level: level, "\(logMessage)")
    }
}
@available(iOS 14.0, *)
public final class Logger {
    private static let loggers: [Logging] = {
        // if in testing return empty array of logging
        if NSClassFromString("XCTest") != nil { return [] }
        return [ SystemLogger() ]
    }()
    public static func log(_ message: String,
                    category: KeyPath<LoggingCategories, String>,
                    level: OSLogType,
                    file: StaticString = #fileID,
                    function: StaticString = #function,
                    line: UInt = #line) {
        loggers.forEach { logger in
            logger.log(message, category: category, level: level, file: file, function: function, line: line)
        }
    }
}
// swiftlint:enable all
