//
//  KeyboardStore.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Combine
import Foundation
import SwiftUI

public class KeyboardStore: Store {
    @Published public var keyboardVisible = false
    @Published public var keyboardHeight: CGFloat = 0

    override public func setup() {
        // Setup our keyboard forwarding
        Publishers
            .Merge(
                NotificationCenter
                    .default
                    .publisher(for: UIResponder.keyboardWillShowNotification)
                    .map {
                        self.keyboardHeight = $0.keyboardHeight
                        return true
                    },
                NotificationCenter
                    .default
                    .publisher(for: UIResponder.keyboardWillHideNotification)
                    .map { _ in
                        self.keyboardHeight = 0
                        return false
                    }
            )
            .sink { visible in
                self.keyboardVisible = visible
            }
            .store(in: &disposables)
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension DependencyMap {
    private struct KeyboardStoreKey: DependencyKey {
        static var dependency: KeyboardStore = .init()
    }

    public var keyboardStore: KeyboardStore {
        get { resolve(key: KeyboardStoreKey.self) }
        set { register(key: KeyboardStoreKey.self, dependency: newValue) }
    }
}
