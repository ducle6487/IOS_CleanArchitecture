//
//  DashboardSection.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

/// Section builder helper
///
/// Builds a section with a title and optional action
/// wrapping the content of the section in a rounded shape
public struct DashboardSection<Content: View>: View {
    @EnvironmentObject var theme: ThemeProvider

    var text: String
    var secondaryText: String?
    var actionText: String?
    var actionColor: Color?
    var action: ButtonAction
    var content: Content

    public init(
        _ text: String,
        secondaryText: String? = nil,
        actionText: String? = nil,
        actionColor: Color? = nil,
        action: @escaping ButtonAction = {},
        @ViewBuilder content: () -> Content
    ) {
        self.text = text
        self.secondaryText = secondaryText
        self.actionText = actionText
        self.actionColor = actionColor
        self.action = action
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.cozy) {
            header

            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    /// Header builder helper
    ///
    /// Builds header with optional action for section
    private var header: some View {
        HStack(spacing: theme.spacing.cozy) {
            Text(text)
                .foregroundStyle(theme.colors.onSurface)
                .font(.caption.weight(.semibold))
                .accessibilityIdentifier("section-title")

            Spacer()

            if let actionText {
                Button(action: action) {
                    Text(actionText)
                        .font(.caption)
                }
                .foregroundColor(actionColor ?? theme.colors.primary)
                .accessibilityIdentifier("section-action")
            } else if let secondaryText {
                Text(secondaryText)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(theme.colors.onSurface)
            }
        }
        .padding(.horizontal, theme.spacing.cozy)
        .foregroundColor(.white)
    }
}

// MARK: - Previews

struct DashboardSection_Previews: PreviewProvider {
    static var previews: some View {
        DashboardSection("Section 3", actionText: "see more", actionColor: .green, action: {}) {
            Text("This is a simple section without secondary text or actions.")
                .foregroundStyle(.white)
                .padding()
        }
        .previewTheme(for: .light)
    }
}
