//
//  ApiConfig.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 5/12/24.
//

import Foundation

class APIConfig {
    static let baseUrl: URL = .init(string: "https://api.github.com/")!

    // Function to append path to base URL and return the full URL
    static func fullURL(for path: String) -> URL {
        return DependencyMap
            .resolve(\.apiValues)
            .baseUrl
            .appendingPathComponent(DependencyMap.resolve(\.apiValues).version)
            .appendingPathComponent(path)
    }

    static func baseUrl(for path: String) -> URL {
        return baseUrl.appendingPathComponent(path)
    }
}
