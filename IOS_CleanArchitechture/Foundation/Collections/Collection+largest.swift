//
//  Collection+Iterator.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public extension Collection {
    /// Finds the object in a collection with the largest value for a given key path.
    ///
    /// - Parameters:
    ///   - by: The key path to the property to compare.
    ///
    /// - Returns: The object with the largest value for the given key path, or `nil` if the collection is empty.
    func largest<V: Comparable>(by keyPath: KeyPath<Element, V>) -> Element? {
        return self.max { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
}
