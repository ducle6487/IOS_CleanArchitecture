//
//  View+statusBarStyle.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public extension View {
    /// Sets the status bar style for this view
    ///
    /// Sets the status bar that should be active whilst this view is the topmost visible view.
    /// Saves the last status bar style and will reapply it on removal of the view from the view hierarchy.
    func statusBarStyle(_ style: UIStatusBarStyle) -> some View {
        return self
            .onAppear {
                UIApplication.setStatusBarStyle(style)
            }
    }
}
