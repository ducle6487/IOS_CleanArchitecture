//
//  CleanArchitecture_MVVM_C_SwiftUIApp.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import SwiftUI

@main
struct CleanArchitecture_MVVM_C_SwiftUIApp: App {
    // MARK: - Injection

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var themeProvider: ThemeProvider
    @Inject(\.deeplinking) var deeplinking

    init() {
        let themeProvider = ThemeProvider(with: ColorScheme.light)
        _themeProvider = StateObject(wrappedValue: themeProvider)
    }

    var body: some Scene {
        WindowGroup {
            StatusBarHost {
                rootView
            }
            .ignoresSafeArea()
            .onOpenURL { url in
                deeplinking.deeplink(to: url.absoluteString)
            }
            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
                if let urlString = userActivity.webpageURL?.absoluteString {
                    deeplinking.deeplink(to: urlString)
                }
            }
        }
    }

    var rootView: some View {
        AppRootView()
            .environmentObject(themeProvider)
    }
}
