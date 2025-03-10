//
//  PlaceholderButton.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public struct PlaceholderButton: View {
    @EnvironmentObject var theme: ThemeProvider

    public init() {}

    public var body: some View {
        RoundedRectangle(cornerRadius: theme.radius.large)
            .foregroundColor(theme.colors.onBackground)
            .frame(maxWidth: .infinity)
            .frame(height: 54)
    }
}

struct PlaceholderButtonPreviews: PreviewProvider {
    static var previews: some View {
        PlaceholderButton()
            .shimmering()
            .padding(.horizontal, 16)
            .previewTheme(for: .light)
    }
}
