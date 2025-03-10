//
//  LoggableWrapper.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

struct LoggableWrapper: Loggable {
    var loggable: any Loggable
    var literal: String { sensitivity == .public ? "\(loggable.literal)" : Self.mask }
    var sensitivity: Sensitivity

    init(loggable: some Loggable, sensitivity: Sensitivity) {
        self.loggable = loggable
        self.sensitivity = sensitivity
    }
}

public extension Loggable {
    var `public`: any Loggable { LoggableWrapper(loggable: self, sensitivity: .public) }
    var `private`: any Loggable { LoggableWrapper(loggable: self, sensitivity: .private) }
}
