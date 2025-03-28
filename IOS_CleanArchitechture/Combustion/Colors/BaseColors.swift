//
//  BaseColors.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

// MARK: - EmpLogger color defaults

struct AppLightColors: CombustionColors {
    var background: Color = ColorTokens.Blacks.black80.opacity(0.9)
    var surface: Color = ColorTokens.Blacks.black60
    var error: Color = ColorTokens.Reds.red
    
    var primary: Color = ColorTokens.Greens.brightChartreuse
    var primaryLightVariant: Color = ColorTokens.Greens.brightChartreuse
    var primaryDarkVariant: Color = ColorTokens.Greens.brightChartreuse
    
    var secondary: Color = ColorTokens.Reds.red
    var secondaryLightVariant: Color = ColorTokens.Reds.red60
    var secondaryDarkVariant: Color = ColorTokens.Reds.red
    
    var onBackground: Color = ColorTokens.Neutrals.white
    var onSurface: Color = ColorTokens.Blacks.black20
    var onError: Color = ColorTokens.Neutrals.white
    var onPrimary: Color = ColorTokens.Blacks.black
    var onSecondary: Color = ColorTokens.Blacks.black30
}

struct AppDarkColors: CombustionColors {
    var background: Color = ColorTokens.Blacks.black80.opacity(0.9)
    var surface: Color = ColorTokens.Blacks.black60
    var error: Color = ColorTokens.Reds.red
    
    var primary: Color = ColorTokens.Greens.brightChartreuse
    var primaryLightVariant: Color = ColorTokens.Greens.brightChartreuse
    var primaryDarkVariant: Color = ColorTokens.Greens.brightChartreuse
    
    var secondary: Color = ColorTokens.Reds.red
    var secondaryLightVariant: Color = ColorTokens.Reds.red60
    var secondaryDarkVariant: Color = ColorTokens.Reds.red
    
    var onBackground: Color = ColorTokens.Neutrals.white
    var onSurface: Color = ColorTokens.Blacks.black20
    var onError: Color = ColorTokens.Neutrals.white
    var onPrimary: Color = ColorTokens.Blacks.black
    var onSecondary: Color = ColorTokens.Blacks.black30
}
