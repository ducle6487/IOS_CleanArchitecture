//
//  AppDI.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import OSLog

extension AppDelegate {
    func registerDI() {
        register(\.appNavigationStore, dependency: AppNavigationStore())
        register(\.analytics, dependency: RemoteAnalytics())
        register(\.deeplinking, dependency: DeeplinkInteractor())
    }

    func registerEnvironment() {
        #if RELEASE
        let environment = AppEnvironment.production
        #elseif STAGING
        let environment = AppEnvironment.staging
        #else
        let environment = AppEnvironment.development
        #endif
        register(\.appEnvironment, dependency: environment)
    }
}
