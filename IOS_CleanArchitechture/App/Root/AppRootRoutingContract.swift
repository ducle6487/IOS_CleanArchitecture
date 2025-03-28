//
//  AppRootRoutingContract.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

protocol AppRootRoutingContract {
    var routeToHome: MapsView { get }
}

extension RouterContractFactory: AppRootRoutingContract {
    var routeToHome: MapsView {
        MapsView()
    }
}
