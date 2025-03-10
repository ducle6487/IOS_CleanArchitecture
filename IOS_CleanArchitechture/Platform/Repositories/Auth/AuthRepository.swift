//
//  AuthRepository.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Combine

protocol AuthRepositoryType {
    func login(username: String, password: String) -> AnyPublisher<TokenModel, Error>

    func logout() -> AnyPublisher<EmptyResponseModel, Error>
}

class AuthRepository: AuthRepositoryType {
    func login(username: String, password: String) -> AnyPublisher<TokenModel, any Error> {
        let params: [String: Any] = [
            "username": username,
            "password": password,
        ]

        return APIService
            .shared
            .request(nonBaseResponse: AuthAPIRouter.login(params: params))
            .tryMap { token in
                token
            }.eraseToAnyPublisher()
    }

    func logout() -> AnyPublisher<EmptyResponseModel, any Error> {
        return APIService
            .shared
            .request(nonBaseResponse: AuthAPIRouter.logout)
            .eraseToAnyPublisher()
    }
}
