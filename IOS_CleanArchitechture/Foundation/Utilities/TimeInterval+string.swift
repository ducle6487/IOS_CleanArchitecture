//
//  TimeInterval+string.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public extension TimeInterval {
    var displayTimeAsString: String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)

        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
