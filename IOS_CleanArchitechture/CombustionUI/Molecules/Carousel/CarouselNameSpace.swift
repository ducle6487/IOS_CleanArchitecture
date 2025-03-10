//
//  CarouselNameSpace.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

// MARK: - Carousel Namespace

private struct CarouselNamespaceKey: EnvironmentKey {
    static var defaultValue: Namespace.ID?
}

public extension EnvironmentValues {
    var carouselNamespace: Namespace.ID? {
        get { self[CarouselNamespaceKey.self] }
        set { self[CarouselNamespaceKey.self] = newValue }
    }
}
