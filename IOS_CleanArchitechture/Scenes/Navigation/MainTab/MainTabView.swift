//
//  TabView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

// MARK: - Custom Tab View

public struct MainTabView<Content: View>: View {
    @EnvironmentObject private var theme: ThemeProvider
    @InjectObservable(\.router) var router

    // MARK: Instance Properties

    var selection: Binding<Tab?>
    let content: Content

    // MARK: Tab View Lifecycle

    /// Custom Tab View
    ///
    /// Custom Tab View used for navigation in the application. This gives custom functionality using SwiftUI
    /// as the TabView implementation is tightly coupled to UIKit and UITabBar.appearance()
    ///
    /// - Parameters:
    ///
    init(_ selection: Binding<Tab?>, @ViewBuilder content: () -> Content) {
        self.selection = selection
        self.content = content()
    }

    public var body: some View {
        ///
        /// Body wrapper for TabView
        ///
        /// This wrapper is used to wrap both the current page view's contents
        /// as well as the fixed tab view.
        ///
        ZStack {
            // Background for the tab bar content
            theme.colors.background
                .ignoresSafeArea()

            // Wrap our Custom Tab View and push to the bottom
            VStack(spacing: 0) {
                // Wrapper VStack to enforce content full width and height
                // even when wrappedValue is empty or EmptyView()
                VStack {
                    // Current selected page content
                    selection.wrappedValue?.destination.compose()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                if router.isTabBarVisible {
                    tabBarWrapper
                        .transition(.move(edge: .bottom))
                }
            }
            .animation(theme.motion.easeInOutMedium, value: router.isTabBarVisible)
            .ignoresSafeArea(.keyboard)
        }
    }
}

// MARK: - Configure content

extension MainTabView {
    /// Arrange our TabItems horizontally within our custom tab bar
    var tabBarWrapper: some View {
        ZStack {
            // Tab bar background color to extend into safe area
            theme.colors.surface
                .ignoresSafeArea()

            HStack {
                content
            }
            .padding(theme.spacing.comfortable)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: 53
        )
    }
}

// MARK: - Previews

struct CustomTabView_Previews: PreviewProvider {
    @State static var selection: Tab?

    static var previews: some View {
        MainTabView($selection) {
            MainTabItemView(icon: Icons.Tabs.home, isSelected: true, name: "First")
            MainTabItemView(icon: Icons.Tabs.home, isSelected: false, name: "Second")
            MainTabItemView(icon: Icons.Tabs.home, isSelected: false, name: "Third")
            MainTabItemView(icon: Icons.Tabs.home, isSelected: false, name: "Fourth")
        }
        .previewTheme(for: .light)
    }
}
