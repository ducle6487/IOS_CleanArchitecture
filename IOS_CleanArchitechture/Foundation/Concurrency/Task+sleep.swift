//
//  Task+sleep.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation

public extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }

    static func sleep(until interval: TimeInterval) async throws {
        guard interval.seconds > 0 else { return }
        let duration = UInt64(interval.seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}
