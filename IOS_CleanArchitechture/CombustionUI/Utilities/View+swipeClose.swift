//
//  View+swipeClose.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

struct SwipeCloseGestureModifier: ViewModifier {
    @Binding var dragOffset: CGFloat
    var maxDrag: CGFloat
    var dismissAction: () -> Void

    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        dragOffset = gesture.translation.height
                        if dragOffset < 0 {
                            dragOffset = .zero
                        }
                        if dragOffset > maxDrag {
                            dismissAction()
                        }
                    }
                    .onEnded { _ in
                        if dragOffset < maxDrag {
                            dragOffset = .zero
                        }
                    }
            )
    }
}

public extension View {
    func swipeClose(
        dragOffset: Binding<CGFloat>,
        maxDrag: CGFloat = 100,
        dismissAction: @escaping () -> Void
    ) -> some View {
        modifier(SwipeCloseGestureModifier(dragOffset: dragOffset, maxDrag: maxDrag, dismissAction: dismissAction))
    }
}
