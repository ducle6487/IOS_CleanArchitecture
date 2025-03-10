//
//  Inject.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

@propertyWrapper
public struct Inject<Dependency>: DependencyLifecycleScope {
    private let keyPath: WritableKeyPath<DependencyMap, Dependency>
    public var wrappedValue: Dependency {
        get { resolve(keyPath) }
        set { register(keyPath, dependency: newValue) }
    }
    public init(_ keyPath: WritableKeyPath<DependencyMap, Dependency>) {
        self.keyPath = keyPath
    }
}
