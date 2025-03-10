//
//  Collection+at.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public extension Collection {
    /// Access element with index use `.at(index)` instead of `.[index]`
    func at(_ index: Self.Index) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}
