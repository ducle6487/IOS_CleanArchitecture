//
//  VisualEffectContainer.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI
import UIKit

struct VisualEffectContainer: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(
        _ uiView: UIVisualEffectView,
        context: UIViewRepresentableContext<Self>
    ) { uiView.effect = effect }
}

public struct BlurredBackground<Content: View>: View {
    public typealias OnTap = () -> Void
    var style: UIBlurEffect.Style
    var content: Content
    var onTap: OnTap?

    public init(_ style: UIBlurEffect.Style, @ViewBuilder content: () -> Content, onTap: OnTap?) {
        self.style = style
        self.content = content()
        self.onTap = onTap
    }

    public var body: some View {
        ZStack {
            VisualEffectContainer(effect: UIBlurEffect(style: style))
                .ignoresSafeArea()
                .onTapGesture {
                    onTap?()
                }

            content
        }
        .fullSizeTopLayout()
    }
}
