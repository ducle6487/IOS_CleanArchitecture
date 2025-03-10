//
//  ProfileInteracting.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public protocol ProfileInteracting: Interactor, DeeplinkHandler {}

// MARK: - Dependency registration

extension DependencyMap {
    private struct ProfileInteractorKey: DependencyKey {
        static var dependency: any ProfileInteracting = ProfileInteractor()
    }

    public var profileInteractor: any ProfileInteracting {
        get { resolve(key: ProfileInteractorKey.self) }
        set { register(key: ProfileInteractorKey.self, dependency: newValue) }
    }
}
