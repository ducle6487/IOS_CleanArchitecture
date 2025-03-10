//
//  DeepLinkConfig.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 10/12/24.
//

import Foundation

public protocol DeeplinkingConfig {
    var appPortalUrl: String { get }
}

struct DevDeeplinkingConfig: DeeplinkingConfig {
    var appPortalUrl: String = "https://google.com"
}

struct StgDeeplinkingConfig: DeeplinkingConfig {
    var appPortalUrl: String = "https://google.com"
}

struct ProdDeeplinkingConfig: DeeplinkingConfig {
    var appPortalUrl: String = "https://google.com"
}

extension DependencyMap {
    private struct DeeplinkingConfigKey: DependencyKey {
        @Inject(\.appEnvironment) static var environment

        static var dependency: any DeeplinkingConfig = {
            switch environment {
            case .development: return DevDeeplinkingConfig()
            case .staging: return StgDeeplinkingConfig()
            case .production: return ProdDeeplinkingConfig()
            }
        }()
    }

    var deeplinkingConfig: any DeeplinkingConfig {
        get { resolve(key: DeeplinkingConfigKey.self) }
        set { register(key: DeeplinkingConfigKey.self, dependency: newValue) }
    }
}
