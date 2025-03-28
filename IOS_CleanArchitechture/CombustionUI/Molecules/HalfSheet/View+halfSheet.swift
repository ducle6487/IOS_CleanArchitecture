//
//  View+halfSheet.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

struct HalfSheetModifier<SheetContent: View>: ViewModifier {
    @EnvironmentObject var theme: ThemeProvider
    var presentSheet: Binding<Bool>
    @ViewBuilder var sheetContent: () -> SheetContent
    var onDismiss: () -> Void = {}

    init(
        _ presentSheet: Binding<Bool>,
        @ViewBuilder sheetContent: @escaping () -> SheetContent,
        onDismiss: @escaping () -> Void = {}
    ) {
        self.presentSheet = presentSheet
        self.sheetContent = sheetContent
        self.onDismiss = onDismiss
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            HalfSheetView(isPresented: presentSheet, onDismiss: onDismiss) {
                sheetContent()
            }
        }
    }
}

public extension View {
    func halfSheet<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content,
        onDismiss: @escaping () -> Void = {}
    ) -> some View {
        modifier(HalfSheetModifier(isPresented, sheetContent: content, onDismiss: onDismiss))
    }

    // MARK: - Autoclosure wrapper

    func halfSheet<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content,
        onDismiss: @autoclosure @escaping () -> Void
    ) -> some View {
        halfSheet(isPresented: isPresented, content: content, onDismiss: onDismiss)
    }
}
