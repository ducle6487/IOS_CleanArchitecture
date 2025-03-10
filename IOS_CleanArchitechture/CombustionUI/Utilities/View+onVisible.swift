//
//  View+onVisible.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public extension View {
    func onVisible(
        parentGeometry: GeometryProxy,
        perform action: @escaping () -> Void
    ) -> some View {
        modifier(OnVisibleModifier(parentGeometry: parentGeometry, action: action))
    }
}

private struct OnVisibleModifier: ViewModifier {
    struct VisibleKey: PreferenceKey {
        static var defaultValue: Bool = false
        static func reduce(value: inout Bool, nextValue: () -> Bool) {}
    }

    var parentGeometry: GeometryProxy
    @State var action: (() -> Void)?

    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: VisibleKey.self,
                        value:
                        parentGeometry
                            .frame(in: .global)
                            .intersects(proxy.frame(in: .global))
                    )
                    .onPreferenceChange(VisibleKey.self) { isVisible in
                        guard isVisible else { return }
                        action?()
                        action = nil
                    }
            }
        }
    }
}
