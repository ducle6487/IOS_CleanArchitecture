//
//  StatusBarHost.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

// MARK: - View root wrapper

public struct StatusBarHost<Content: View>: UIViewControllerRepresentable {
    private var content: Content

    public init(content: () -> Content) {
        self.content = content()
    }

    public func makeUIViewController(context: Context) -> some UIViewController {
        StatusBarController(rootView: content)
    }

    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
