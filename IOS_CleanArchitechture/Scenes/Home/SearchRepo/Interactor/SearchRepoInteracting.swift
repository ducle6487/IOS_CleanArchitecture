//
//  SearchRepoInteracting.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public protocol SearchRepoInteracting: Interactor, DeeplinkHandler {
    func searchClear()
}

// MARK: - Dependency registration

extension DependencyMap {
    private struct SearchRepoInteractorKey: DependencyKey {
        static var dependency: any SearchRepoInteracting = SearchRepoInteractor()
    }

    public var searchRepoInteractor: any SearchRepoInteracting {
        get { resolve(key: SearchRepoInteractorKey.self) }
        set { register(key: SearchRepoInteractorKey.self, dependency: newValue) }
    }
}
