//
//  Double+delay.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation

// MARK: - Delays

public extension Double {
    static var delayFast: Double {
        DurationTokens.fast
    }

    static var delayMedium: Double {
        DurationTokens.medium
    }

    static var delaySlow: Double {
        DurationTokens.slow
    }
}
