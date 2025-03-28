//
//  CombustionText.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 26/3/25.
//

import SwiftUI

struct CombustionText: View {
    // MARK: Environment

    @EnvironmentObject private var theme: ThemeProvider

    public var text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .foregroundStyle(theme.colors.onBackground)
            .shadow(radius: 4)
    }
}

struct CombustionText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white

            VStack {
                CombustionText(text: "Text")
            }
        }

        .previewTheme(for: .light)
    }
}
