//
//  View+themePreview.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

extension View {
    private func provideTheme(for scheme: ColorScheme) -> ThemeProvider {
        ThemeProvider(with: scheme)
    }

    public func previewTheme(for scheme: ColorScheme) -> some View {
        let theme = provideTheme(for: scheme)
        return ZStack {
            theme.colors.background
                .ignoresSafeArea()
                .preferredColorScheme(scheme)

            self.environmentObject(theme)
        }
    }
}
