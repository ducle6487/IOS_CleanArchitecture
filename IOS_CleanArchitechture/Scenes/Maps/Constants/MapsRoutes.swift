//
//  Routes.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

protocol MapsRouterContractFactory {
    var routeToMaps: MapsView { get }
}

extension RouterContractFactory: MapsRouterContractFactory {
    public var routeToMaps: MapsView { MapsView() }
}
