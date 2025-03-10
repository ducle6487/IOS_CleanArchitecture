//
//  ProfileView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public struct ProfileView: View {
    public var body: some View {
        NavigationView {
            Text("body")
                .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewTheme(for: .light)
    }
}
