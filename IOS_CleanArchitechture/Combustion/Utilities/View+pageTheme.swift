//
//  View+pageTheme.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

struct ThemeForPage: ViewModifier {
    @EnvironmentObject var theme: ThemeProvider
    @State var lastTheme: CombustionTheme?
    var newTheme: any CombustionTheme
    
    init(_ theme: some CombustionTheme) {
        self.newTheme = theme
    }
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                lastTheme = theme.current
                theme.change(to: newTheme)
            }
            .onDisappear {
                if let lastTheme { theme.change(to: lastTheme) }
            }
    }
}

extension View {
    public func pageTheme(_ theme: some CombustionTheme) -> some View {
        self.modifier(ThemeForPage(theme))
    }
}
