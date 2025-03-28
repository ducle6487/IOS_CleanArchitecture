//
//  View+toast.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 27/3/25.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @EnvironmentObject var theme: ThemeProvider
    var presentToast: Binding<Bool>
    var message: String?

    init(
        _ presentToast: Binding<Bool>,
        message: String?
    ) {
        self.presentToast = presentToast
        self.message = message
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            if let message {
                ToastView(isPresented: presentToast, message: message)
            }
        }
    }
}

public extension View {
    func toast(
        isPresented: Binding<Bool>,
        message: String?
    ) -> some View {
        modifier(ToastModifier(isPresented, message: message))
    }
}
