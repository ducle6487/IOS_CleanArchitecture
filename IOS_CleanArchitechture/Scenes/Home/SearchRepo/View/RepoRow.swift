//
//  RepoRow.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import SwiftUI

struct RepoRow: View {
    var repo: GithubRepoEntities
    @State var isNavigateToDetail: Bool = false
    @Inject(\.deeplinking) var deeplinking

    var body: some View {
        HStack {
            NavigationLink(destination: DetailRepoView(repo: repo), isActive: $isNavigateToDetail) {
                VStack(alignment: .leading) {
                    Text(repo.fullname ?? "")
                        .font(.headline)

                    Text(repo.name ?? "")
                        .font(.subheadline)
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
//            isNavigateToDetail = true
//            deeplinking.deeplink(to: Deeplink(type: .tab(Tabs.news.tab)))
        }
    }
}
