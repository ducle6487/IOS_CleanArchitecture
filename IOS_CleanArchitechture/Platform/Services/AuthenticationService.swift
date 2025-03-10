//
//  AuthenticationService.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 5/12/24.
//

import Foundation

class AuthenticationService: ObservableObject {
    static var shared = AuthenticationService()
    
    @UserDefault(keyName: UserDefaultConstantKey.accessToken, defaultValue: "") var accessToken: String
    @UserDefault(keyName: UserDefaultConstantKey.accessToken, defaultValue: "") var refreshToken: String
    
    func getAccessToken() -> String {
        return accessToken
    }
    
    func setAccessToken(_ token: String) {
        accessToken = token
    }
    
    func getRefreshToken() -> String {
        return refreshToken
    }
    
    func setRefreshToken(_ token: String) {
        refreshToken = token
    }
}
