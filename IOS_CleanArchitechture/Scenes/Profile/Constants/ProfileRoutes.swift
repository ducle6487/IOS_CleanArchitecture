//
//  Routes.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

protocol ProfileRouterContractFactory {
    var routeToProfile: ProfileView { get }
}

extension RouterContractFactory: ProfileRouterContractFactory {
    public var routeToProfile: ProfileView { ProfileView() }
}
