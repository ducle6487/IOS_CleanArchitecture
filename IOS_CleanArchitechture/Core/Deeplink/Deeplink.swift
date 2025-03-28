//
//  Deeplink.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public struct Deeplink {
    public enum LinkType {
        case view
        case external(URL)
    }

    public var type: LinkType
    public var action: DeeplinkAction?
    public var query: String?
    public var queries: [URLQueryItem]?

    public init(type: LinkType, action: DeeplinkAction? = nil, query: String? = nil, queries: [URLQueryItem]? = nil) {
        self.type = type
        self.action = action
        self.query = query
        self.queries = queries
    }
}

extension Deeplink.LinkType: Equatable {
    public static func == (lhs: Deeplink.LinkType, rhs: Deeplink.LinkType) -> Bool {
        switch (lhs, rhs) {
        case (.view, .view): return lhs == rhs
        case (.external(let lhs), .external(let rhs)): return lhs == rhs
        default: return false
        }
    }
}

public enum DeeplinkAction: String {
    // MARK: Common

    /// Common deeplinks are handled differently on different tabs
    case paymentMethods = "paymentmethods"
}
