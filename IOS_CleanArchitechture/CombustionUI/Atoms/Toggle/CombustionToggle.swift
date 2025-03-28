//
//  CombustionToggle.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 27/3/25.
//

import SwiftUI

struct CombustionToggleStyle: ToggleStyle {
    @EnvironmentObject private var theme: ThemeProvider

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 11)
                .fill(configuration.isOn ? theme.colors.primary : ColorTokens.Blacks.black70)
                .animation(theme.motion.linearMedium, value: configuration.isOn)
                .frame(width: 54, height: 30)
                .shadow(radius: 2)

            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(8)
                .frame(width: 24, height: 24)
                .offset(x: configuration.isOn ? 12 : -12)
                .shadow(radius: 2)
                .animation(theme.motion.linearMedium, value: configuration.isOn)
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}

struct CombustionToggle: View {
    @Binding var isOn: Bool

    init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }

    var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(CombustionToggleStyle())
    }
}

struct CombustionToggle_Previews: PreviewProvider {
    struct Wrapper: View {
        @State var isOn = false

        var body: some View {
            CombustionToggle(isOn: $isOn)
        }
    }

    static var previews: some View {
        Wrapper()
            .previewTheme(for: .light)
    }
}
