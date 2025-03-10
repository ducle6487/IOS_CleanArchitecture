//
//  RegistrationNameSpace.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

private struct RegistrationNamespaceKey: EnvironmentKey {
    static var defaultValue: Namespace.ID?
}

public extension EnvironmentValues {
    var registrationNamespace: Namespace.ID? {
        get { self[RegistrationNamespaceKey.self] }
        set { self[RegistrationNamespaceKey.self] = newValue }
    }
}
