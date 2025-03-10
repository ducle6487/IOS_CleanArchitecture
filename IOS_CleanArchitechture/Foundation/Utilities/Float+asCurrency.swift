//
//  Float+asCurrency.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public extension Float {
    var asCurrency: String {
        String(format: "$%.0f", self)
    }
}
