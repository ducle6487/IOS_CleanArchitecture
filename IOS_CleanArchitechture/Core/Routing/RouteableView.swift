//
//  RouteableView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public struct RouteableView: Equatable {
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
                Task { @MainActor in onDisappear?() }
            }
    }

    // ✅ Compare by identifier
    public static func == (lhs: RouteableView, rhs: RouteableView) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
