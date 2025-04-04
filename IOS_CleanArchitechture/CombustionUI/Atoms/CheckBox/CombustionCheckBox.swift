//
//  CheckBox.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public struct CombustionCheckbox: View {
    @EnvironmentObject var theme: ThemeProvider
    @Binding var isChecked: Bool
    @Binding var enabled: Bool

    public init(isChecked: Binding<Bool>, enabled: Binding<Bool>) {
        self._isChecked = isChecked
        self._enabled = enabled
    }

    public var body: some View {
        Button(action: {
            if enabled {
                isChecked.toggle()
            }
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(isChecked ? theme.colors.primary : theme.colors.onSurface)
                .opacity(enabled ? 1 : 0.6)
        }
        .disabled(!enabled)
    }
}

struct CombustionCheckbox_Previews: PreviewProvider {
    private struct Wrapper: View {
        @State var checked = false
        @State var enabled = true
        var body: some View {
            VStack {
                CombustionCheckbox(isChecked: $checked, enabled: $enabled)
            }
        }
    }

    static var previews: some View {
        Wrapper()
            .previewTheme(for: .light)
    }
}
