//
//  AppNavigation.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

final class AppNavigationStore: Store, AppNavigationStoring {
//    @Inject(\.profileStore) var profileStore
    @Inject(\.router) var router

    /// Builds the navigation tabs using a `NavBuilder` result builder.
    @NavBuilder var tabs: [Tab] {
        Tabs.home.tab
        Tabs.employee.tab
        Tabs.news.tab
        Tabs.profile.tab
    }

    override func setup() {
        super.setup()
        router.tabSelectedSubject = tabs.first!
    }
}
