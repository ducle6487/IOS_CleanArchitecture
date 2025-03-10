//
//  RoundedShapesType.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation
import SwiftUI

public enum RoundedShapeType {
    case small
    case medium
    case large
    case extraLarge

    func cornerRadius(for theme: ThemeProvider) -> CGFloat {
        switch self {
        case .small:
            return theme.radius.small
        case .medium:
            return theme.radius.medium
        case .large:
            return theme.radius.large
        case .extraLarge:
            return theme.radius.extraLarge
        }
    }
}
