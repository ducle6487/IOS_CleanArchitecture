//
//  Logging.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation

public protocol Logging {
    var loggerType: LoggingComponent { get }
}

public extension Logging {
    func log(_ message: any Loggable, _ component: LoggingComponent? = nil, level: Severity = .verbose) {
        Self.log(message, component ?? loggerType, level: level)
    }

    func log(_ message: (any Loggable)?..., component: LoggingComponent? = nil, level: Severity = .verbose) {
        let message = message
            .compactMap { $0 }
            .reduce("") { res, msg in "\(res) \(msg.literal)" }

        Self.log(message, component ?? loggerType, level: level)
    }

    static func log(_ message: any Loggable, _ component: LoggingComponent, level: Severity = .verbose) {
        DependencyMap.resolve(\.logger).log(message, component, level)
    }
}

public protocol ComposedLogging {}
public extension ComposedLogging {
    func log(_ message: any Loggable, _ component: LoggingComponent, level: Severity = .verbose) {
        Self.log(message, component, level: level)
    }

    func log(_ message: (any Loggable)?..., component: LoggingComponent, level: Severity = .verbose) {
        let message = message.compactMap { $0 }
            .reduce("") { res, msg in "\(res) \(msg.literal)" }

        Self.log(message, component, level: level)
    }

    static func log(_ message: any Loggable, _ component: LoggingComponent, level: Severity = .verbose) {
        DependencyMap.resolve(\.logger).log(message, component, level)
    }
}
