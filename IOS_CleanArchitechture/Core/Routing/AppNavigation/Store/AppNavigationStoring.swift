//
//  AppNavigationStoring.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public protocol AppNavigationStoring: Store {
    var tabs: [Tab] { get }
}

public class EmptyNavigationStore: Store, AppNavigationStoring {
    public var tabs: [Tab] {
        fatalError("Provide your own instance of a navigation store")
    }
}

// MARK: - Dependency registration

extension DependencyMap {
    private struct AppNavigationStoreKey: DependencyKey {
        static var dependency: any AppNavigationStoring = EmptyNavigationStore()
    }

    public var appNavigationStore: any AppNavigationStoring {
        get { resolve(key: AppNavigationStoreKey.self) }
        set { register(key: AppNavigationStoreKey.self, dependency: newValue) }
    }
}
