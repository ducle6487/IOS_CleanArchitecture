//
//  AppDelegate.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate, DependencyRegistrant, Logging {
    var loggerType: LoggingComponent = .other("appDelegate")

    @Inject(\.appEnvironment) var environment

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        registerEnvironment()
        FirebaseConfig.setup()
        registerDI()

        return true
    }
}
