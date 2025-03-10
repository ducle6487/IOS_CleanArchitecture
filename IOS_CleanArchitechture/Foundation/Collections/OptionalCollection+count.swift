//
//  OptionalCollection+count.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public extension Optional where Wrapped: Collection {
    var countOrNone: Int {
        self?.count ?? 0
    }
}
