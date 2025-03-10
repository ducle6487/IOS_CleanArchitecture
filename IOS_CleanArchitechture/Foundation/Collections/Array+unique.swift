//
//  Array+unique.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public extension Array where Element: Hashable {
    /// Make array element unique
    var unique: [Element] {
        var seen = Set<Element>()
        return filter { seen.insert($0).inserted }
    }
}
