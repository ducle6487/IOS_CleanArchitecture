//
//  OptionalCollection+containsOrFalse.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

extension Optional where Wrapped: Collection {
    @inlinable public func containsOrFalse(where predicate: @escaping (Wrapped.Element) -> Bool) -> Bool {
        self?.contains(where: predicate) ?? false
    }
}
