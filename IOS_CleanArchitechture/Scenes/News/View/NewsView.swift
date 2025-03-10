//
//  NewsView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public struct NewsView: View {
    public var body: some View {
        NavigationView {
            Text("body")
                .navigationTitle("News")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .previewTheme(for: .light)
    }
}
