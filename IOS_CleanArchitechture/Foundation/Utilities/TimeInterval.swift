//
//  TimeInterval.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation

public extension TimeInterval {
    var seconds: Int {
        return Int(self.rounded())
    }

    var milliseconds: Int {
        return Int(self * 1_000)
    }
}
