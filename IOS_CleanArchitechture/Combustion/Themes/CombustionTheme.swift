//
//  CombustionThemes.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public protocol ColorSchemeConformable {
    static var lightColors: CombustionColors { get }
    static var darkColors: CombustionColors { get }
}

public protocol CombustionTheme: ColorSchemeConformable {
    var colors: CombustionColors { get set }
    var spacing: CombustionSpacing { get set }
    var typography: CombustionTypography { get set }
    var radius: CombustionRadius { get set }
    var motion: CombustionMotion { get set }
}

public struct BaseTheme: CombustionTheme {
    public static var lightColors: CombustionColors = AppLightColors()
    public static var darkColors: CombustionColors = AppDarkColors()
    public var colors: CombustionColors = lightColors
    public var spacing: CombustionSpacing = BaseSpacing()
    public var typography: CombustionTypography = BaseTypography()
    public var radius: CombustionRadius = BaseRadius()
    public var motion: CombustionMotion = BaseMotion()
    public init() {}
}
