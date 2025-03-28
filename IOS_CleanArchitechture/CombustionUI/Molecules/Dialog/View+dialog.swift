//
//  View+dialog.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 26/3/25.
//

import SwiftUI

struct DialogModifier: ViewModifier {
    @EnvironmentObject var theme: ThemeProvider
    var presentDialog: Binding<Bool>
    var dialogContent: DialogContent?

    init(
        _ presentDialog: Binding<Bool>,
        dialogContent: DialogContent?
    ) {
        self.presentDialog = presentDialog
        self.dialogContent = dialogContent
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            if let dialogContent {
                DialogView(isPresented: presentDialog, content: dialogContent)
            }
        }
    }
}

public extension View {
    func dialog(
        isPresented: Binding<Bool>,
        content: DialogContent?
    ) -> some View {
        modifier(DialogModifier(isPresented, dialogContent: content))
    }
}
