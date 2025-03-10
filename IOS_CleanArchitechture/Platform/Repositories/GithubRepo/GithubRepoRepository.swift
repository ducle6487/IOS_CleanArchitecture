//
//  GithubRepoRepository.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import Combine
import Foundation

protocol GithubRepositoryType {
    func searchRepo(query: String) -> AnyPublisher<[GithubRepoEntities], Error>
}

extension DependencyMap {
    private struct GithubRepositoryKey: DependencyKey {
        static var dependency: any GithubRepositoryType = GithubRepoRepository()
    }
    
    var githubRepository: any GithubRepositoryType {
        get { resolve(key: GithubRepositoryKey.self) }
        set { register(key: GithubRepositoryKey.self, dependency: newValue) }
    }
}

class GithubRepoRepository: GithubRepositoryType {
    func searchRepo(query: String) -> AnyPublisher<[GithubRepoEntities], Error> {
        let param: [String: Any] = [
            "q": query,
            "per_page": 10,
            "page": 1
        ]
        
        return APIService
            .shared
            .request(nonBaseResponse: SearchRepoAPIRouter.searchRepo(param: param))
            .tryMap { (response: GithubRepoModel) in
                response.githubRepos ?? []
            }
            .eraseToAnyPublisher()
    }
}
