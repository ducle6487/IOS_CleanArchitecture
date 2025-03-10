//
//  View+swallowTask.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public extension View {
    func swallowTask(
        priority: TaskPriority = .userInitiated,
        _ action: @escaping @Sendable () async throws -> Void
    ) -> some View {
        self.task {
            do {
                try await action()
            } catch {
                DependencyMap.resolve(\.logger).log("Swallowing Error: \(error.localizedDescription)", .error, .error)
            }
        }
    }
}
