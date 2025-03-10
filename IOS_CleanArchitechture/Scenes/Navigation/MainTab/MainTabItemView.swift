//
//  TabItemView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

// MARK: - TabItemView

struct MainTabItemView: View {
    @EnvironmentObject private var theme: ThemeProvider

    // MARK: Instance properties

    var icon: Image
    var selectedIcon: Image?
    var isSelected: Bool
    var name: String

    // MARK: - View properties

    var textColor: Color {
        return isSelected ? theme.colors.primary : theme.colors.onSurface.opacity(0.6)
    }

    // MARK: View composition

    var body: some View {
        VStack {
            Group {
                if isSelected {
                    (selectedIcon ?? icon).resizable()
                } else {
                    icon.resizable()
                }
            }
            .aspectRatio(contentMode: .fit)
            .frame(
                width: 22,
                height: 22
            )

            Text(name)
                .font(.system(size: 10))
                .fixedSize()
        }
        .foregroundColor(textColor)
        .animation(theme.motion.easeInMedium, value: textColor)
        .frame(
            maxWidth: .infinity
        )
    }
}

// MARK: - Previews

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        MainTabItemView(icon: Icons.Tabs.homeSelected, isSelected: true, name: "Home")
            .previewTheme(for: .light)
    }
}
