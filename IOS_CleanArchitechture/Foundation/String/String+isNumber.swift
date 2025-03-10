//
//  String+isNumber.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public extension String {
    var isNumber: Bool {
        self.allSatisfy { $0.isNumber }
    }

    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}
