//
//  Color+hex.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

extension Color {
    /// Create a color from a UInt hex
    /// e.g. 0xFFFFFF
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
