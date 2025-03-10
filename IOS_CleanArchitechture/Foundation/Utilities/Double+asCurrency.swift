//
//  double+asCurrency.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public extension Double {
    var asCurrency: String {
        String(format: "$%.2f", self)
    }
}
