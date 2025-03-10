//
//  Routes.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

protocol EmployeeRouterContractFactory {
    var routeToEmployee: EmployeeView { get }
}

extension RouterContractFactory: EmployeeRouterContractFactory {
    public var routeToEmployee: EmployeeView { EmployeeView() }
}
