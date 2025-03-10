//
//  SearchRepoStore.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 10/12/24.
//

import Combine
import Foundation

final class SearchRepoStore: Store, SearchRepoStoring {
    // MARK: Properties

    private var bag = Set<AnyCancellable>()

    // MARK: Published

    @Published var searchText = ""
    @Published var githubRepos: StoreState<[GithubRepoEntities]> = .loading(placeholder: [])

    // MARK: Injection

    @Inject(\.githubRepoUseCase) var useCase

    override func setupBindings() {
        $searchText
            .filter { !$0.isEmpty }
            .removeDuplicates()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .handleEvents(receiveOutput: { [weak self] _ in
                DispatchQueue.main.async {
                    self?.githubRepos = .loading(placeholder: [])
                }
            })
            .flatMap { [self] query in
                return useCase.searchRepo(query: query)
                    .receive(on: DispatchQueue.main)
            }.sink { completion in
                switch completion {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.githubRepos = .error(error: error)
                    }
                case .finished:
                    break
                }
            } receiveValue: { repos in
                DispatchQueue.main.async {
                    self.githubRepos = .loaded(data: repos)
                }
            }.store(in: &bag)
    }
}
