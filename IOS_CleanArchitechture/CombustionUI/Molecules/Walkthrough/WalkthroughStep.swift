//
//  WalkthroughStep.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public struct WalkthroughStep: Identifiable, Equatable {
    public var id: UUID
    public var url: URL?
    public var localFile: String?
    public var animation: AnimatedImage?
    public var isFullWidth: Bool
    public var headline: String
    public var description: String
    
    public init(
        id: UUID = UUID(),
        url: URL? = nil,
        localFile: String? = nil,
        animation: AnimatedImage? = nil,
        isFullWidth: Bool = false,
        headline: String, description: String
    ) {
        self.id = id
        self.url = url
        self.localFile = localFile
        self.animation = animation
        self.isFullWidth = isFullWidth
        self.headline = headline
        self.description = description
    }
    
    public static func == (lhs: WalkthroughStep, rhs: WalkthroughStep) -> Bool {
        lhs.id == rhs.id
    }
}
