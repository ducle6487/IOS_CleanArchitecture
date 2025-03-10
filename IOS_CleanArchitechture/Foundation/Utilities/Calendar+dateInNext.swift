//
//  Calendar+dateInNext.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public extension Calendar {
    private var currentDate: Date { return Date() }

    func isExpiryDateWithinOneMonth(_ date: Date) -> Bool {
        guard let nextMonth = self.date(byAdding: DateComponents(month: 1), to: currentDate) else { return false }
        return isDate(date, equalTo: nextMonth, toGranularity: .month)
            || isDate(date, equalTo: currentDate, toGranularity: .month)
    }

    func isExpiryDateInPast(_ date: Date) -> Bool {
        guard let previousMonth = self.date(byAdding: DateComponents(month: -1), to: currentDate) else { return false }
        if isDate(date, equalTo: currentDate, toGranularity: .month) { return false }
        if isDate(date, equalTo: previousMonth, toGranularity: .month) { return true }
        return date < currentDate
    }
}
