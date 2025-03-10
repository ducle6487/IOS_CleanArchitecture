//
//  SearchRepoAPIRouter.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import Alamofire
import UIKit

enum SearchRepoAPIRouter {
    case searchRepo(param: [String: Any])
}

extension SearchRepoAPIRouter: APIInputBase {
    var url: URL {
        let baseURL = APIConfig.baseUrl(for: "search/repositories")
        return baseURL
    }

    var method: HTTPMethod {
        switch self {
        case .searchRepo:
            return .get
        }
    }

    var encoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }

    var parameters: [String: Any]? {
        switch self {
        case .searchRepo(let param):
            return param
        }
    }

    var requireToken: Bool {
        switch self {
        case .searchRepo:
            return false
        }
    }
}
