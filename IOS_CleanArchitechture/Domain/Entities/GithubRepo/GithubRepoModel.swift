//
//  GithubRepoModel.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import ObjectMapper
import UIKit

struct GithubRepoModel: Mappable {
    var githubRepos: [GithubRepoEntities]?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        githubRepos <- map["items"]
    }
}

typealias Model = Identifiable & Mappable

public struct GithubRepoEntities: Model {
    public var id: Int?
    var name: String?
    var fullname: String?

    public init?(map: Map) {}

    public mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        fullname <- map["full_name"]
    }
}
