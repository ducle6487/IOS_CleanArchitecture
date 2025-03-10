//
//  Page.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public struct Page<Content: View>: View {
    @EnvironmentObject private var theme: ThemeProvider
    var content: Content
    var background: Color?
    var foreground: Color?

    public init(background: Color? = nil, foreground: Color? = nil, _ content: () -> Content) {
        self.content = content()
        self.background = background
        self.foreground = foreground
    }

    public var body: some View {
        ZStack(alignment: .top) {
            // Set our background color if it has been specified
            Group {
                background ?? theme.colors.background
            }
            .ignoresSafeArea()

            content.foregroundColor(foreground ?? theme.colors.onBackground)
        }
        .fullSizeTopLayout()
    }
}
