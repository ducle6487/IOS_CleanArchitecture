//
//  DurationTokens.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation

enum DurationTokens {
    /// Duration for animations that should not slow down the user's interaction
    static let fast: CGFloat = 0.1
    /// Duration for animations that should catch a user's attention
    static let medium: CGFloat = 0.2
    /// Duration for animations that are longer running and block the user's interaction
    static let slow: CGFloat = 0.4
}
