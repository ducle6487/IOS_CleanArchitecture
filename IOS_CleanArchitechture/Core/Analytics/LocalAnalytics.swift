//
//  LocalAnalytics.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

/// Naive local implementation of analytics tracking through loging
/// Used as a default `AnalyticsTracker` when no remote analytics tracker
/// is implemented
struct LocalAnalytics: AnalyticsTracker, Logging {
    var loggerType: LoggingComponent = .analytics
    func log(event: String, parameters: AnalyticsEventParameters) {
        log("Tracking Analytics Event: '\(event)' with params: '\(parameters)'")
    }

    func log(screen: String, parameters: AnalyticsEventParameters) {
        log("Tracking Screen View with params: '\(parameters)'")
    }
}
