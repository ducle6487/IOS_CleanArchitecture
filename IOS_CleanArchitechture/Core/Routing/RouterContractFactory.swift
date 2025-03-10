//
//  RouterContractFactory.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public final class RouterContractFactory {}

// MARK: - Dependency registration

extension DependencyMap {
    private struct RouterContractFactoryKey: DependencyKey {
        static var dependency: RouterContractFactory = .init()
    }

    public var contractFactory: RouterContractFactory {
        get { resolve(key: RouterContractFactoryKey.self) }
        set { register(key: RouterContractFactoryKey.self, dependency: newValue) }
    }
}
