//
//  Logger.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import OSLog

public enum Severity: String, Codable {
    case warning = "Warning"
    case info = "Information"
    case verbose = "Verbose"
    case error = "Error"
    case critical = "Critical"

    public var osLevel: OSLogType {
        switch self {
        case .warning: return .default
        case .info: return .info
        case .verbose: return .debug
        case .error: return .error
        case .critical: return .fault
        }
    }

    public var alwaysLog: Bool {
        switch self {
        case .info: return false
        case .verbose: return false
        case .warning: return true
        case .error: return true
        case .critical: return true
        }
    }
}
