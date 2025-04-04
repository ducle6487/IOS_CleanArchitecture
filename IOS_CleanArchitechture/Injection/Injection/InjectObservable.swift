//
//  InjectObservable.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Combine
import SwiftUI

@propertyWrapper
public struct InjectObservable<Dependency>: DynamicProperty, DependencyLifecycleScope {
    @dynamicMemberLookup
    public struct Wrapper {
        private var wrapped: InjectObservable
        
        init(_ wrap: InjectObservable<Dependency>) {
            self.wrapped = wrap
        }
        
        public subscript<Subject>(
            dynamicMember keyPath: ReferenceWritableKeyPath<Dependency, Subject>
        ) -> Binding<Subject> {
            Binding(
                get: { self.wrapped.wrappedValue[keyPath: keyPath] },
                set: { self.wrapped.wrappedValue[keyPath: keyPath] = $0 }
            )
        }
    }
    
    private let keyPath: WritableKeyPath<DependencyMap, Dependency>
    public var wrappedValue: Dependency {
        get { resolve(keyPath) }
        set {
            register(keyPath, dependency: newValue)
            observe()
        }
    }
    
    @ObservedObject var observableObject = EmptyObservableObject()
    
    /// Projected value
    ///
    /// The projected value provides a `$` binding accessor to the calling site, much like `ObservableObject`
    /// or `StateObject` and produces a binding for SwiftUI view heirarchy to observe changes on.
    public var projectedValue: Wrapper {
        Wrapper(self)
    }
    
    public init(_ keyPath: WritableKeyPath<DependencyMap, Dependency>) {
        self.keyPath = keyPath
        observe()
    }
    
    private mutating func observe() {
        let observable = wrappedValue as? AnyObservableObject
        
        precondition(observable != nil, "Cannot observe an object that does not confrom to 'AnyObservableObject'")
        
        // Unwrapping safely to avoid force!
        // Should never get here if observable is nil due to precondition
        if let observable {
            observableObject = .init(
                changePublisher: observable.objectWillChange.eraseToAnyPublisher()
            )
        }
    }
}
