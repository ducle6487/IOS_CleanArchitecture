//
//  OSLogger.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation
import OSLog

public final class OSLogger: Logger {
    private var loggers: [LoggingComponent: os.Logger] = [:]
    public init() {}

    public func log(_ message: any Loggable, _ component: LoggingComponent, _ level: Severity) {
        Task {
            await createLoggerIfNeeded(with: component)
            let literal = "\(message.literal)"
            loggers[component]?.log(level: level.osLevel, "\(literal, privacy: .auto)")
        }
    }

    @MainActor
    private func createLoggerIfNeeded(with component: LoggingComponent) {
        guard loggers[component] == nil else { return }
        let subsystem = Bundle.main.bundleIdentifier ?? ""
        let logger = os.Logger(subsystem: subsystem, category: component.category)
        loggers[component] = logger
    }
}
