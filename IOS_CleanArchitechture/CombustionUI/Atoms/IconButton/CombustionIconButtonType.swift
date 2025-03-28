//
//  CombustionIconButtonType.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 27/3/25.
//

import SwiftUI

public enum CombustionIconButtonType {
    case _primary(_ onSurface: Bool)
    case _secondary(_ onSurface: Bool)
    case _tertiary(_ onSurface: Bool)
    case tertiaryAlternative
    case primaryTextOnly
    case secondaryTextOnly
    case tertiaryTextOnly
    case custom(textColor: Color = .clear, backgroundColor: Color = .clear)
    
    // MARK: - Button text colors

    func textColor(for theme: ThemeProvider, enabled: Bool) -> Color {
        enabled ? enabledTextColors(theme) : disabledTextColors(theme)
    }
    
    private func enabledTextColors(_ theme: ThemeProvider) -> Color {
        switch self {
        case ._primary:
            return theme.colors.onPrimary
        case ._secondary:
            return theme.colors.primary
        case ._tertiary:
            return theme.colors.onError
        case .tertiaryAlternative:
            return theme.colors.secondary
        case .primaryTextOnly:
            return theme.colors.primary
        case .secondaryTextOnly:
            return theme.colors.onPrimary
        case .tertiaryTextOnly:
            return theme.colors.secondary
        case .custom:
            return .clear
        }
    }
    
    private func disabledTextColors(_ theme: ThemeProvider) -> Color {
        switch self {
        case ._primary:
            return theme.colors.onSurface.opacity(0.4)
        case ._secondary:
            return theme.colors.onSurface.opacity(0.4)
        case ._tertiary:
            return theme.colors.onError.opacity(0.4)
        case .tertiaryAlternative:
            return theme.colors.onSurface.opacity(0.4)
        case .primaryTextOnly:
            return theme.colors.primary.opacity(0.4)
        case .secondaryTextOnly:
            return theme.colors.onPrimary.opacity(0.4)
        case .tertiaryTextOnly:
            return theme.colors.onPrimary.opacity(0.4)
        case .custom:
            return .clear
        }
    }
    
    // MARK: - Button background colors

    func backgroundColor(for theme: ThemeProvider, enabled: Bool) -> Color {
        enabled ? enabledBackgroundColors(theme) : disabledBackgroundColors(theme)
    }
    
    private func enabledBackgroundColors(_ theme: ThemeProvider) -> Color {
        switch self {
        case ._primary:
            return theme.colors.primary
        case ._secondary(let onSurface):
            return onSurface ? theme.colors.background : .clear
        case ._tertiary:
            return theme.colors.onPrimary
        case .tertiaryAlternative:
            return theme.colors.surface
        case .primaryTextOnly:
            return .clear
        case .secondaryTextOnly:
            return .clear
        case .tertiaryTextOnly:
            return .clear
        case .custom:
            return .clear
        }
    }
    
    private func disabledBackgroundColors(_ theme: ThemeProvider) -> Color {
        switch self {
        case ._primary(let onSurface):
            return (onSurface ? theme.colors.background : theme.colors.surface).opacity(0.6)
        case ._secondary(let onSurface):
            return (onSurface ? theme.colors.background : theme.colors.surface).opacity(0.6)
        case ._tertiary(let onSurface):
            return (onSurface ? theme.colors.background : theme.colors.surface).opacity(0.6)
        case .tertiaryAlternative:
            return theme.colors.surface
        case .primaryTextOnly:
            return .clear
        case .secondaryTextOnly:
            return .clear
        case .tertiaryTextOnly:
            return .clear
        case .custom:
            return .clear
        }
    }
}

// MARK: - On surface convenience inits

public extension CombustionIconButtonType {
    // MARK: - Primary Conveniences

    /// Convenience accessor for secondary button type without a parameter
    static var primary: CombustionIconButtonType {
        primary()
    }
    
    static func primary(onSurface: Bool = false) -> CombustionIconButtonType {
        ._primary(onSurface)
    }
    
    // MARK: - Secondary Conveniences

    /// Convenience accessor for secondary button type without a parameter
    static var secondary: CombustionIconButtonType {
        secondary()
    }
    
    static func secondary(onSurface: Bool = false) -> CombustionIconButtonType {
        ._secondary(onSurface)
    }
    
    // MARK: - Tertiary Conveniences

    /// Convenience accessor for secondary button type without a parameter
    static var tertiary: CombustionIconButtonType {
        tertiary()
    }
    
    static func tertiary(onSurface: Bool = false) -> CombustionIconButtonType {
        ._tertiary(onSurface)
    }
}
