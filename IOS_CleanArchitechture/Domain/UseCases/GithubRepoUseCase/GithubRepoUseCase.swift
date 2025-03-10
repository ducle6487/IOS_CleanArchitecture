//
//  GithubRepoUseCase.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import Combine
import Foundation

protocol GithubRepoUseCaseType {
    func searchRepo(query: String) -> AnyPublisher<[GithubRepoEntities], Error>
}

extension DependencyMap {
    private struct GithubRepoUseCaseKey: DependencyKey {
        static var dependency: any GithubRepoUseCaseType = GithubRepoUseCase()
    }

    var githubRepoUseCase: any GithubRepoUseCaseType {
        get { resolve(key: GithubRepoUseCaseKey.self) }
        set { register(key: GithubRepoUseCaseKey.self, dependency: newValue) }
    }
}

class GithubRepoUseCase: GithubRepoUseCaseType {
    @Inject(\.githubRepository) var repository

    func searchRepo(query: String) -> AnyPublisher<[GithubRepoEntities], Error> {
        repository.searchRepo(query: query)
    }
}
