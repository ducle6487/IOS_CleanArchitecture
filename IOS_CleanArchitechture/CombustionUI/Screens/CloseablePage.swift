//
//  CloseablePage.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public struct ClosablePage<Content: View>: View {
    @EnvironmentObject private var theme: ThemeProvider
    var title: Text
    var closeAction: ButtonAction
    var content: Content

    public init(
        title: Text,
        closeAction: @escaping ButtonAction,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.closeAction = closeAction
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: theme.spacing.comfortable) {
            ZStack {
                HStack(spacing: theme.spacing.comfortable) {
                    Button(action: closeAction) {
                        Image(systemName: "xmark")
                            .font(.headline.weight(.semibold))
                            .foregroundColor(theme.colors.onBackground)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: theme.spacing.comfortable) {
                    title
                        .bold()
                        .foregroundColor(theme.colors.onBackground)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(theme.spacing.comfortable)
            .background(theme.colors.surface.ignoresSafeArea())

            content
        }
    }
}

// MARK: - Previews

struct ClosablePage_Previews: PreviewProvider {
    static var previews: some View {
        ClosablePage(
            title: Text("Add payment method"),
            closeAction: {}
        ) {
            Text("Page body")
            Spacer()
        }
        .previewTheme(for: .light)
    }
}
