//
//  Double+dp.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

extension Double {
    public func dp(_ dp: Int) -> String {
        String(format: "%.\(dp)f", self)
    }
}
