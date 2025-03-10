//
//  SearchRepoInteractor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Combine
import Foundation

final class SearchRepoInteractor: Interactor, SearchRepoInteracting {
    // MARK: Injection

    @Inject(\.searchRepoStore) var store

    func searchClear() {
        store.githubRepos = .loading(placeholder: [])
    }
}

extension SearchRepoInteractor {
    func handle(deeplink: Deeplink) {
        switch deeplink.action {
        default: break
        }
    }
}
