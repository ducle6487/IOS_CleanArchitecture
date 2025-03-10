//
//  ScaledOppacityButtonStryle.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public struct ScaledOpacityButtonStyle: ButtonStyle {
    @EnvironmentObject var theme: ThemeProvider
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(theme.motion.easeInOutFast, value: configuration.isPressed)
    }
}

public extension ButtonStyle where Self == ScaledOpacityButtonStyle {
    static var scaledOpacity: ScaledOpacityButtonStyle {
        ScaledOpacityButtonStyle()
    }
}
