//
//  MapLocationModel.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 11/3/25.
//

import Foundation

public struct MapLocationModel: Identifiable {
    public var id = UUID()
    public var name: String
    public var latitude: Double
    public var longitude: Double
}
