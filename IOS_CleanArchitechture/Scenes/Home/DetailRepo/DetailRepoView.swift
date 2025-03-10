//
//  DetailRepoView.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import SwiftUI

struct DetailRepoView: View {
    var repo: GithubRepoEntities
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Text(repo.fullname ?? "")
            .navigationTitle(repo.name ?? "")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRepoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRepoView(repo: .init(JSON: [:])!)
    }
}
