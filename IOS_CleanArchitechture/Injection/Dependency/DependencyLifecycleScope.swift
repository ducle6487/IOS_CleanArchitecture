//
//  DependencyLifecycleScopr.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

// Compose our protocols together for all functionality whilst still separating concerns
public protocol DependencyLifecycleScope: DependencyResolver, DependencyRegistrant {}
public protocol DependencyRegistrant {}
public protocol DependencyResolver {}

public extension DependencyRegistrant {
    /// Register a dependency by keyPath
    ///
    /// Forwards dependency registration to the `DependencyMap`
    func register<Dependency>(_ keyPath: WritableKeyPath<DependencyMap, Dependency>, dependency: Dependency) {
        DependencyMap.map[keyPath: keyPath] = dependency
    }

    /// Register a dependency by key
    ///
    /// Forwards dependency registration via dependency key to the `DependencyMap`
    func register<Key>(key: Key.Type, dependency: Key.Value) where Key: DependencyKey {
        key.dependency = dependency
    }
}

public extension DependencyResolver {
    /// Resolve a dependency
    ///
    /// Forwards dependency resolution to the `DependencyMap`
    func resolve<Dependency>(_ keyPath: WritableKeyPath<DependencyMap, Dependency>) -> Dependency {
        Self.resolve(keyPath)
    }

    /// Resolution outside of self scope or inside initializers
    ///
    /// Forwards dependency resolution to the `DependencyMap`
    static func resolve<Dependency>(_ keyPath: WritableKeyPath<DependencyMap, Dependency>) -> Dependency {
        return DependencyMap.map[keyPath: keyPath]
    }

    /// Register a dependency by key
    ///
    /// Forwards dependency registration via dependency key to the `DependencyMap`
    func resolve<Key>(key: Key.Type) -> Key.Value where Key: DependencyKey {
        return key.dependency
    }
}
