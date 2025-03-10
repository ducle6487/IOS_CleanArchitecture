//
//  TaskArray+start.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public extension Array where Element == Task<Void, Error> {
    mutating func start(
        priority: TaskPriority = .background,
        @_implicitSelfCapture operation: @escaping @Sendable () async throws -> Void
    ) {
        self.append(Task(priority: priority, operation: operation))
    }
}
