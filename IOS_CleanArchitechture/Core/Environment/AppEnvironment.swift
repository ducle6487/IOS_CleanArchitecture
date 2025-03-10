//
//  AppEnvironment.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public enum AppEnvironment: String, Codable, CaseIterable {
    case development
    case staging
    case production
}

public extension AppEnvironment {
    var isDevelopment: Bool { self == .development }
    var isStaging: Bool { self == .staging }
    var isProduction: Bool { self == .production }

    var displayName: String {
        switch self {
        case .development: return "Development"
        case .staging: return "Staging"
        case .production: return "Version"
        }
    }
}

extension DependencyMap {
    private struct AppEnvironmentKey: DependencyKey {
        static var dependency: AppEnvironment = .development
    }

    public var appEnvironment: AppEnvironment {
        get { resolve(key: AppEnvironmentKey.self) }
        set { register(key: AppEnvironmentKey.self, dependency: newValue) }
    }
}
