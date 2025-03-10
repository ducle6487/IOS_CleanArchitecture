//
//  KeyboardType.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation
import SwiftUI

public enum KeyboardStyle {
    case phoneNumber
    case email
    case numeric
    case generic
}

extension KeyboardStyle {
    var keyboardType: UIKeyboardType {
        switch self {
        case .phoneNumber: return .phonePad
        case .email: return .emailAddress
        case .numeric: return .numberPad
        case .generic: return .default
        }
    }

    var autoCapitalization: TextInputAutocapitalization {
        switch self {
        case .generic: return .sentences
        default: return .never
        }
    }
}
