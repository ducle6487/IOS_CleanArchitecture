//
//  APIValues.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

struct DevApiValues: ApiValues {
    public var baseUrl: URL = .init(string: "https://stag.api.ican.com.vn/api/")!
    public var version: String = "v1.0"
}

struct StgApiValues: ApiValues {
    public var baseUrl: URL = .init(string: "https://stag.api.ican.com.vn/api/")!
    public var version: String = "v1.0"
}

struct ProdApiValues: ApiValues {
    public var baseUrl: URL = .init(string: "https://stag.api.ican.com.vn/api/")!
    public var version: String = "v1.0"
}

// MARK: - Injection

extension DependencyMap {
    private struct ApiValuesKey: DependencyKey {
        @Inject(\.appEnvironment) static var environment
        static var dependency: any ApiValues = {
            switch environment {
            case .development:
                return DevApiValues()
            case .staging:
                return StgApiValues()
            case .production:
                return ProdApiValues()
            }
        }()
    }

    public var apiValues: any ApiValues {
        get { resolve(key: ApiValuesKey.self) }
        set { register(key: ApiValuesKey.self, dependency: newValue) }
    }
}
