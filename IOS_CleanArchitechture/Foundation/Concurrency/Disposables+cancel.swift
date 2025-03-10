//
//  Disposables+cancel.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Combine

public extension Collection where Element: AnyCancellable {
    func cancel() {
        for disposable in self {
            disposable.cancel()
        }
    }
}

public extension Task {
    func store(in set: inout Set<Task<Success, Failure>>) {
        set.insert(self)
    }
}

public extension Collection where Element == Task<Void, Never> {
    func cancel() {
        for task in self {
            task.cancel()
        }
    }
}

public extension Collection where Element == Task<Void, Error> {
    func cancel() {
        for task in self {
            task.cancel()
        }
    }
}
