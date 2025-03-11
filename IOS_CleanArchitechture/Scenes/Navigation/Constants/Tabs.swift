//
//  Tabs.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

enum Tabs: String, Identifiable {
    case home
    case employee
    case maps
    case profile

    var id: String { rawValue }
    var name: String {
        switch self {
        case .home: return "Home"
        case .employee: return "Employee"
        case .maps: return "Maps"
        case .profile: return "Profile"
        }
    }

    var tab: Tab {
        switch self {
        case .home:
            return Tab(
                id: id,
                icon: Icons.Tabs.home,
                selectedIcon: Icons.Tabs.homeSelected,
                name: name,
                event: Event.Button.Tabs.tapNavHome,
                destination: contract.routeToSearchRepo,
                deeplinkHandler: DependencyMap.resolve(\.searchRepoInteractor)
            )
        case .employee:
            return Tab(
                id: id,
                icon: Icons.Tabs.home,
                selectedIcon: Icons.Tabs.homeSelected,
                name: name,
                event: Event.Button.Tabs.tapNavEmployee,
                destination: contract.routeToEmployee,
                deeplinkHandler: DependencyMap.resolve(\.employeeInteractor)
            )
        case .maps:
            return Tab(
                id: id,
                icon: Icons.Tabs.home,
                selectedIcon: Icons.Tabs.homeSelected,
                name: name,
                event: Event.Button.Tabs.tapNavNews,
                destination: contract.routeToMaps,
                deeplinkHandler: DependencyMap.resolve(\.mapsInteractor)
            )
        case .profile:
            return Tab(
                id: id,
                icon: Icons.Tabs.home,
                selectedIcon: Icons.Tabs.homeSelected,
                name: name,
                event: Event.Button.Tabs.tapNavProfile,
                destination: contract.routeToProfile,
                deeplinkHandler: DependencyMap.resolve(\.profileInteractor)
            )
        }
    }

    private var contract: RouterContractFactory {
        DependencyMap.resolve(\.contractFactory)
    }
}
