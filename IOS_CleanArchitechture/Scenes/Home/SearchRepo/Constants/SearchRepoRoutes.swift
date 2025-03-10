//
//  Routes.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

protocol SearchRepoRouterContractFactory {
    var routeToSearchRepo: SearchRepoView { get }
}

extension RouterContractFactory: SearchRepoRouterContractFactory {
    public var routeToSearchRepo: SearchRepoView { SearchRepoView() }
}
