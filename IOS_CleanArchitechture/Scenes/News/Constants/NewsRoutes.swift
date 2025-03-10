//
//  Routes.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

protocol NewsRouterContractFactory {
    var routeToNews: EmployeeView { get }
}

extension RouterContractFactory: NewsRouterContractFactory {
    public var routeToNews: EmployeeView { EmployeeView() }
}
