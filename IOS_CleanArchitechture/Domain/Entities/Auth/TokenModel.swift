//
//  TokenModel.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import ObjectMapper

struct TokenModel: Mappable {
    var accessToken: String?
    var refreshToken: String?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        accessToken <- map["accessToken"]
        refreshToken <- map["refreshToken"]
    }
}
