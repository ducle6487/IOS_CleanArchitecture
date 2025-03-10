//
//  String+asDate.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public extension String {
    var asDate: Date? {
        return DateFormatters.iso8601Formatter.date(from: self)
    }
}
