//
//  EmptyResponse.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import ObjectMapper

struct EmptyResponseModel: Mappable {
    init?(map: ObjectMapper.Map) {}

    mutating func mapping(map: ObjectMapper.Map) {}
}
