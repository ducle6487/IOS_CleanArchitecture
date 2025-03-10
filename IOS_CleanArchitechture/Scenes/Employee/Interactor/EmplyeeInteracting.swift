//
//  EmplyeeInteracting.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public protocol EmployeeInteracting: Interactor, DeeplinkHandler {}

// MARK: - Dependency registration

extension DependencyMap {
    private struct EmployeeInteractorKey: DependencyKey {
        static var dependency: any EmployeeInteracting = EmployeeInteractor()
    }

    public var employeeInteractor: any EmployeeInteracting {
        get { resolve(key: EmployeeInteractorKey.self) }
        set { register(key: EmployeeInteractorKey.self, dependency: newValue) }
    }
}
