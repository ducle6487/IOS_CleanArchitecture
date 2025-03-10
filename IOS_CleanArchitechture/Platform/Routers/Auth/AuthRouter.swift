//
//  AuthRouter.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Alamofire
import Foundation

enum AuthAPIRouter {
    case login(params: [String: Any])
    case logout
}

extension AuthAPIRouter: APIInputBase {
    var url: URL {
        switch self {
        case .login(params: _):
            return APIConfig.fullURL(for: "auth/sign-in")
        case .logout:
            return APIConfig.fullURL(for: "auth/sign-out")
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login(params: _):
            return .post
        case .logout:
            return .post
        }
    }

    var encoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }

    var parameters: [String: Any]? {
        switch self {
        case .login(params: let params):
            return params
        case .logout:
            return nil
        }
    }

    var requireToken: Bool {
        switch self {
        case .login:
            return false
        case .logout:
            return true
        }
    }
}
