//
//  Untitled.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

struct RoundedCellModifier: ViewModifier {
    @EnvironmentObject var theme: ThemeProvider
    var backgroundColor: Color

    func body(content: Content) -> some View {
        RoundedShape(.extraLarge, padding: theme.spacing.cozy, backgroundColor: backgroundColor) {
            content
        }
    }
}

public extension View {
    func roundedCell(_ backgroundColor: Color = .clear) -> some View {
        modifier(RoundedCellModifier(backgroundColor: backgroundColor))
    }
}
