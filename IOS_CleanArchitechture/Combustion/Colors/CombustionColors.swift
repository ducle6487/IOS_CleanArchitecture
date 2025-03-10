//
//  CombustionColor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public protocol CombustionColors {
    var background: Color { get }
    var surface: Color { get }
    var error: Color { get }

    var primary: Color { get }
    var primaryLightVariant: Color { get }
    var primaryDarkVariant: Color { get }

    var secondary: Color { get }
    var secondaryLightVariant: Color { get }
    var secondaryDarkVariant: Color { get }

    // Foregrounds
    var onBackground: Color { get }
    var onSurface: Color { get }
    var onError: Color { get }
    var onPrimary: Color { get }
    var onSecondary: Color { get }
}
