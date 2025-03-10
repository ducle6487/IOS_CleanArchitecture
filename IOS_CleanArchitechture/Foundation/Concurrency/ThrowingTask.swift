//
//  ThrowingTask.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

/// Convenience initialiser to handle errors within unstructured concurrency.
///
/// Forwards the catch block of the internal task operation to the defined catch block.
public extension Task where Failure == Never, Success == Void {
    @discardableResult init(
        priority: TaskPriority? = nil,
        @_implicitSelfCapture operation: @escaping @Sendable () async throws -> Success,
        @_implicitSelfCapture catch: @escaping (Error) async -> Void
    ) {
        self.init(priority: priority) {
            do {
                _ = try await operation()
            } catch {
                await `catch`(error)
            }
        }
    }
}
