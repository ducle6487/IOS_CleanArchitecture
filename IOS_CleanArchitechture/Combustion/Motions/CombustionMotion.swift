//
//  CombustionMotion.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public protocol CombustionMotion {
    // MARK: - Easing
    /// Ease In Out for animations that should not slow down the user's interaction
    var easeInOutFast: Animation { get }
    /// Ease In for animations that should not slow down the user's interaction
    var easeInFast: Animation { get }
    /// Ease Out for animations that should not slow down the user's interaction
    var easeOutFast: Animation { get }
    
    /// Ease In Out animations that should catch a user's attention
    var easeInOutMedium: Animation { get }
    /// Ease In animations that should catch a user's attention
    var easeInMedium: Animation { get }
    /// Ease Out for animations that should catch a user's attention
    var easeOutMedium: Animation { get }
    
    /// Ease In Out for animations that are longer running and block the user's interaction
    var easeInOutSlow: Animation { get }
    /// Ease In for animations that are longer running and block the user's interaction
    var easeInSlow: Animation { get }
    /// Ease Out for animations that are longer running and block the user's interaction
    var easeOutSlow: Animation { get }
    
    // MARK: - Linear
    /// Linear for animations that should not slow down the user's interaction
    var linearFast: Animation { get }
    /// Linear for animations that should catch a user's attention
    var linearMedium: Animation { get }
    /// Linear for animations that are longer running and block the user's interaction
    var linearSlow: Animation { get }
}
