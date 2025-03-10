//
//  SearchRepoView.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import SwiftUI

public struct SearchRepoView: View {
    @Inject(\.searchRepoInteractor) var interactor
    @InjectObservable(\.searchRepoStore) var store
    @EnvironmentObject private var theme: ThemeProvider

    public var body: some View {
        NavigationView { // Ensure the view is wrapped in a NavigationView
            store.githubRepos.buildViewFromState { repos in
                content(repos: repos)
            } loadingBlock: { _ in
                if !store.searchText.isEmpty {
                    VStack {
                        GenericLoadingView(.cells(4))
                        Spacer()
                    }
                    .background(theme.colors.background)
                }
            }
            .navigationTitle("Github repo") // This will now work
            .registerInteractorLifecycle(interactor)
            .searchable(text: $store.searchText)
            .onChange(of: store.searchText) { newValue in
                if newValue.isEmpty {
                    interactor.searchClear()
                }
            }
        }
    }

    @ViewBuilder
    func content(repos: [GithubRepoEntities]) -> some View {
        List {
            ForEach(repos, id: \.id) { repo in
                RepoRow(repo: repo)
            }
        }
        .overlay {
            if repos.isEmpty && !store.searchText.isEmpty {
                VStack(spacing: theme.spacing.comfortable) {
                    Image(systemName: "magnifyingglass")
                        .frame(height: 30)
                    VStack {
                        Text("Không có kết quả tìm kiếm")
                            .font(.body)
                        Text("\"\(store.searchText)\"")
                            .font(.body)
                            .bold()
                    }
                }
            }
        }
    }
}

struct SearchRepoView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRepoView()
            .previewTheme(for: .light)
    }
}
