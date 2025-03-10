//
//  View+analyticsScreen.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

struct AnalyticsScreenModifier: ViewModifier {
    @EnvironmentObject var theme: ThemeProvider
    @Inject(\.analytics) var analytics

    var screenName: String
    var screenClass: String = "View"
    var extras: [String: Any]
    private var scopedExtras: [String: Any] {
        [
            "theme": theme.isDarkMode ? "darkMode" : "lightMode",
            "screen_class": screenClass,
        ]
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                // Log the screen appearing with extra information about the screen
                analytics.log(
                    screen: screenName,
                    parameters: extras.merging(scopedExtras, uniquingKeysWith: MergingStrategy.keepOld)
                )
            }
    }
}

public extension View {
    func analytics(screen: String, extras: [String: Any] = [:]) -> some View {
        modifier(AnalyticsScreenModifier(screenName: screen, extras: extras))
    }
}
