//
//  RouteableView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public struct RouteableView {
    public var identifier: UUID
    private var onDisappear: Router.SheetDismissCompletion?
    private var content: AnyView

    public init(identifier: UUID = UUID(), onDisappear: Router.SheetDismissCompletion? = nil, _ content: some View) {
        self.identifier = identifier
        self.onDisappear = onDisappear
        self.content = AnyView(content)
    }

    @ViewBuilder
    public func compose() -> some View {
        content
            .onDisappear {
                // Trigger our disappear on disappear
                Task { @MainActor in onDisappear?() }
            }
    }
}
