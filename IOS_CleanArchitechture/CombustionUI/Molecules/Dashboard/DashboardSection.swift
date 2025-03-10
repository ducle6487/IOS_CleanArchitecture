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
    var action: ButtonAction
    var content: Content

    public init(
        _ text: String,
        secondaryText: String? = nil,
        actionText: String? = nil,
        action: @escaping ButtonAction = {},
        @ViewBuilder content: () -> Content
    ) {
        self.text = text
        self.secondaryText = secondaryText
        self.actionText = actionText
        self.action = action
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.cozy) {
            header

            RoundedShape(.extraLarge) {
                // make our content full width for the surface
                // card to wrap around
                content
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    /// Header builder helper
    ///
    /// Builds header with optional action for section
    private var header: some View {
        HStack(spacing: theme.spacing.cozy) {
            Text(text)
                .font(.headline)
                .accessibilityIdentifier("section-title")

            Spacer()

            if let actionText {
                Button(action: action) {
                    Text(actionText)
                        .font(.caption)
                }
                .foregroundColor(theme.colors.primary)
                .accessibilityIdentifier("section-action")
            } else if let secondaryText {
                Text(secondaryText)
                    .font(.caption)
            }
        }
        .padding(.horizontal, theme.spacing.cozy)
        .foregroundColor(theme.colors.onBackground)
    }
}

// MARK: - Previews

struct DashboardSection_Previews: PreviewProvider {
    static var previews: some View {
        DashboardSection("Section 3") {
            Text("This is a simple section without secondary text or actions.")
                .padding()
        }
        .previewTheme(for: .light)
    }
}
