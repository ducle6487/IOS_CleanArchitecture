//
//  ApiValues.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public protocol ApiValues {
    var baseUrl: URL { get }
    var version: String { get }
}
