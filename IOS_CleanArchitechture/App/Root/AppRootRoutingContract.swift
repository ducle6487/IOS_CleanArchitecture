//
//  AppRootRoutingContract.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

protocol AppRootRoutingContract {
    var routeToNavigationRoot: AppNavigationView { get }
}

extension RouterContractFactory: AppRootRoutingContract {
    var routeToNavigationRoot: AppNavigationView {
        AppNavigationView()
    }
}
