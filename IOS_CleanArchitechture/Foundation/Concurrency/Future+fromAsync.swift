//
//  Future+fromAsync.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Combine

public extension Future where Failure == Error {
    static func from(async: @escaping () async throws -> Output) -> AnyPublisher<Output, Failure> {
        return Future<Output, Failure> { promise in
            Task {
                do {
                    let result = try await async()
                    promise(.success(result))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
