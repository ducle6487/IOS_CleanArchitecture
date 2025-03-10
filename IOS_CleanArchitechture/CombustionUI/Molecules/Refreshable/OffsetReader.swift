//
//  OffsetReader.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

private struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    /// Reads the offset of a view inside of a coordinate space
    @ViewBuilder
    func offset(coordinateSpace: String, offset: @escaping (CGFloat) -> Void) -> some View {
        self.overlay {
            GeometryReader { proxy in
                let minY = proxy.frame(in: .named(coordinateSpace)).minY

                Color.clear
                    .preference(key: OffsetKey.self, value: minY)
                    .onPreferenceChange(OffsetKey.self) { value in
                        offset(value)
                    }
            }
        }
    }
}
