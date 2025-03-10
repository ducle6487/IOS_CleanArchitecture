//
//  Date+toString.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public extension Date {
    var displayDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE dd MMM yyyy"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }

    var shortDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
}
