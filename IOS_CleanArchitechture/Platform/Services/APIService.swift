//
//  APIService.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import Alamofire
import Combine
import Foundation
import ObjectMapper

enum NetworkManager {
    static let kRequestTimeOut: TimeInterval = 30
    
    static let session: Session = {
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = kRequestTimeOut
            config.timeoutIntervalForResource = kRequestTimeOut
            config.httpMaximumConnectionsPerHost = 10
            return config
        }()
        let session = Session(configuration: configuration, serverTrustManager: nil)
        return session
    }()
}

class APIService {
    private let session = NetworkManager.session
    private var cancelBag = Set<AnyCancellable>()
    
    static let shared: APIService = {
        let instance = APIService()
        return instance
    }()
    
    func request<T: Mappable>(nonBaseResponse input: APIInputBase) -> Future<T, Error> {
        var headers: HTTPHeaders {
            var header = HTTPHeaders()
            if input.requireToken {
                header.add(.authorization(bearerToken: AuthenticationService.shared.getAccessToken()))
            }
            header.add(.accept("application/json"))
            return header
        }
        return Future { promise in
            self.session.request(
                input.url,
                method: input.method,
                parameters: input.parameters,
//                encoding: input.encoding,
                headers: headers)
                .responseData(queue: .global(qos: .background)) { dataRequest in
                    switch dataRequest.result {
                    case .success(let value):
                        do {
                            let any = try JSONSerialization.jsonObject(with: value)
                            if let dict = any as? [String: Any], let json = T(JSON: dict) {
                                if dataRequest.response?.statusCode == 200 {
                                    promise(.success(json))
                                } else if dataRequest.response?.statusCode == 401 {
                                    // Token expired, attempt to refresh the token
                                    self.refreshToken { result in
                                        switch result {
                                        case .success(let token):
                                            // Update the token in AuthenticationService
                                            if let accessToken = token.accessToken {
                                                AuthenticationService.shared.setAccessToken(accessToken)
                                            }
                                            if let refreshToken = token.refreshToken {
                                                AuthenticationService.shared.setRefreshToken(refreshToken)
                                            }
                                                          
                                            // Retry the original request with the new token
                                            self.request(nonBaseResponse: input).sink(receiveCompletion: { completion in
                                                switch completion {
                                                case .failure(let error):
                                                    promise(.failure(error))
                                                case .finished:
                                                    break
                                                }
                                            }, receiveValue: { result in
                                                promise(.success(result))
                                            })
                                            .store(in: &self.cancelBag)
                                        case .failure(let error):
                                            promise(.failure(error))
                                        }
                                    }
                                } else {
                                    promise(.failure(APIError.error(code: dataRequest.response?.statusCode ?? 0, message: "Something wrong, try again!")))
                                }
                            } else {
                                promise(.failure(APIError.invalidResponseData(data: value)))
                            }
                        } catch {
                            promise(.failure(APIError.invalidResponseData(data: value)))
                        }
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
        }
    }
    
    private func refreshToken(completion: @escaping (Result<TokenModel, Error>) -> Void) {
        // Implement the logic to refresh the token using the refresh token.
        // Example: Make a request to the refresh token endpoint and get a new access token.
        
        let refreshToken = AuthenticationService.shared.getRefreshToken()
        
        // Example request to refresh the token
        let parameters: [String: Any] = [
            "refreshToken": refreshToken
        ]
        
        let url = APIConfig.baseUrl(for: "auth/refresh-token")
        
        self.session.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        // Parse the response and extract the new access token
                        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                        if let tokenModel = TokenModel(JSON: json ?? [:]) {
                            completion(.success(tokenModel))
                        } else {
                            completion(.failure(APIError.error(code: 400, message: "Failed to refresh token")))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
