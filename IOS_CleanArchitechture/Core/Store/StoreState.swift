//
//  StoreState.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public enum StoreState<DataType> {
    case loading(placeholder: DataType? = nil)
    case loaded(data: DataType)
    case error(error: Error)
}

// MARK: - Convenience state updates

extension StoreState: ComposedLogging {
    public mutating func loading(with placeholder: DataType? = nil) {
        log("Received loading state for \(Self.self): \n'\(String(describing: placeholder))'", .store)
        self = .loading(placeholder: placeholder)
    }

    public mutating func loaded(with data: DataType) {
        log("Received loaded state for \(Self.self): \n'\(data)'", .store)
        self = .loaded(data: data)
    }

    public mutating func error(with error: Error) {
        log("Received error state for \(Self.self): '\(error.localizedDescription)'", .store)
        self = .error(error: error)
    }
}

extension StoreState: Equatable where DataType: Equatable {
    public static func == (lhs: StoreState<DataType>, rhs: StoreState<DataType>) -> Bool {
        switch (lhs, rhs) {
        case let (.loading(lhsPlaceholder), .loading(rhsPlaceholder)):
            return lhsPlaceholder == rhsPlaceholder
        case let (.loaded(lhsLoaded), .loaded(rhsLoaded)):
            return lhsLoaded == rhsLoaded
        case let (.error(lhsError), .error(rhsEror)):
            return lhsError.localizedDescription == rhsEror.localizedDescription
        default:
            return false
        }
    }
}
