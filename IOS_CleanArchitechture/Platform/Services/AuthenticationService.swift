//
//  AuthenticationService.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 5/12/24.
//

import Foundation

class AuthenticationService: ObservableObject {
    @Inject(\.router) var router
    static var shared = AuthenticationService()
    
    @UserDefault(keyName: UserDefaultConstantKey.accessToken, defaultValue: "") var accessToken: String
    @UserDefault(keyName: UserDefaultConstantKey.accessToken, defaultValue: "") var refreshToken: String
    
    var isAuthenticated: Bool {
        return !accessToken.isEmpty && !refreshToken.isEmpty
    }
    
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
    
    func clearToken() {
        accessToken = ""
        refreshToken = ""
        router.navigate(to: SignInView(), deeplinkHandler: nil)
    }
}
