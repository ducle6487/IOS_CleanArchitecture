//
//  BaseMotion.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation
import SwiftUI

internal struct BaseMotion: CombustionMotion {
    // MARK: - Ease
    var easeInOutFast: Animation = .easeInOut(duration: DurationTokens.fast)
    var easeInFast: Animation = .easeIn(duration: DurationTokens.fast)
    var easeOutFast: Animation = .easeOut(duration: DurationTokens.fast)
    
    var easeInOutMedium: Animation = .easeInOut(duration: DurationTokens.medium)
    var easeInMedium: Animation = .easeIn(duration: DurationTokens.medium)
    var easeOutMedium: Animation = .easeOut(duration: DurationTokens.medium)

    var easeInOutSlow: Animation = .easeInOut(duration: DurationTokens.slow)
    var easeInSlow: Animation = .easeIn(duration: DurationTokens.slow)
    var easeOutSlow: Animation = .easeOut(duration: DurationTokens.slow)
    
    // MARK: - Linear
    var linearFast: Animation = .linear(duration: DurationTokens.fast)
    var linearMedium: Animation = .linear(duration: DurationTokens.medium)
    var linearSlow: Animation = .linear(duration: DurationTokens.slow)
}
