//
//  Logger.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import OSLog

public protocol Logger {
    func log(_ message: any Loggable, _ component: LoggingComponent, _ level: Severity)
}

extension Logger {
    // Forward default logs
    func log(_ message: any Loggable, _ component: LoggingComponent) {
        log(message, component, .verbose)
    }
}

// MARK: - Dependency registration

extension DependencyMap {
    private struct LoggableKey: DependencyKey {
        static var dependency: any Logger = EnabledComponentLogger(logger: OSLogger())
    }

    public var logger: any Logger {
        get { resolve(key: LoggableKey.self) }
        set { register(key: LoggableKey.self, dependency: newValue) }
    }
}
