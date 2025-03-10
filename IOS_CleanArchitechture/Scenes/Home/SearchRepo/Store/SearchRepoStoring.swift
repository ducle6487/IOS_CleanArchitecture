//
//  SearchRepoStoring.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 10/12/24.
//

public protocol SearchRepoStoring: Store {
    var searchText: String { get set }
    var githubRepos: StoreState<[GithubRepoEntities]> { get set }
}

// MARK: - Dependency registration

extension DependencyMap {
    private struct SearchRepoStoreKey: DependencyKey {
        static var dependency: any SearchRepoStoring = SearchRepoStore()
    }

    public var searchRepoStore: any SearchRepoStoring {
        get { resolve(key: SearchRepoStoreKey.self) }
        set { register(key: SearchRepoStoreKey.self, dependency: newValue) }
    }
}
