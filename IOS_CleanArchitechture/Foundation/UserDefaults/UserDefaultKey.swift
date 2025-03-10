//
//  UserDefaultKey.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 5/12/24.
//

public protocol UserDefaultKey {
    var key: String { get }
}

extension String: UserDefaultKey {
    public var key: String { self }
}

