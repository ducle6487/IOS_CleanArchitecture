//
//  ScaledButtonStyle.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public struct ScaledButtonStyle: ButtonStyle {
    @EnvironmentObject var theme: ThemeProvider
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(theme.motion.easeInOutMedium, value: configuration.isPressed)
    }
}

public extension ButtonStyle where Self == ScaledButtonStyle {
    static var scaled: ScaledButtonStyle {
        ScaledButtonStyle()
    }
}
