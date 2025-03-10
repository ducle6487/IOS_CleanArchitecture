//
//  Bool+apply.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public extension Bool {
    func apply(_ closure: () -> Void) {
        if self {
            closure()
        }
    }
}

public extension Optional where Wrapped == Bool {
    func apply(_ closure: () -> Void) {
        self?.apply(closure)
    }
}
