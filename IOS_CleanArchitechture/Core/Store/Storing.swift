//
//  Storing.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Combine

public protocol Storing: AnyObservableObject, ObservableObject {
    func setup()
    func setupBindings()
    func cancel()
}
