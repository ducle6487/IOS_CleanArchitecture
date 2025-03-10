//
//  SafariWebView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SafariServices
import SwiftUI

public struct SafariWebView: UIViewControllerRepresentable {
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
