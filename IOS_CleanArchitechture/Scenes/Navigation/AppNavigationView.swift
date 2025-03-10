//
//  AppNavigationView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

struct AppNavigationView: View {
    @EnvironmentObject private var theme: ThemeProvider
    @InjectObservable(\.router) var router: Router
    @InjectObservable(\.appNavigationStore) var store
    @Inject(\.analytics) var analytics

    var body: some View {
        navigationTabView
    }
}

// MARK: - Tab View

extension AppNavigationView {
    var navigationTabView: some View {
        MainTabView($router.tabSelectedSubject) {
            // Create our tabView's tabs from our list
            ForEach(store.tabs, id: \.id) { tab in
                // Currently selected tab should match our stored tabSelectSubject identifier
                let isSelected = $router.tabSelectedSubject.wrappedValue?.id == tab.id
                // Create our custom tab item
                MainTabItemView(
                    icon: tab.icon,
                    selectedIcon: tab.selectedIcon,
                    isSelected: isSelected,
                    name: tab.name
                )
                .onTapGesture {
                    router.tabSelectedSubject = tab
                    analytics.log(event: tab.event, parameters: [:])
                }
            }
        }
    }
}

// MARK: - Previews

struct AppNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationView()
            .previewTheme(for: .light)
    }
}
