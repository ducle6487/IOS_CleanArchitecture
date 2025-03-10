//
//  EnabledComponentLogger.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

public struct EnabledComponentLogger: Logger {
    var logger: any Logger

    public init(logger: any Logger) {
        self.logger = logger
    }

    public func log(_ message: any Loggable, _ component: LoggingComponent, _ level: Severity) {
        if component.enabled || level.alwaysLog {
            logger.log(message, component, level)
        }
    }
}
