//
//  APIInputBase.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import Foundation
import Alamofire

protocol APIInputBase {
    var url: URL { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var parameters: [String: Any]? { get }
    var requireToken: Bool { get }
}
