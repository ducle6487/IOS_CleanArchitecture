//
//  EmployeeView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public struct EmployeeView: View {
    public var body: some View {
        NavigationView {
            Text("body")
                .navigationTitle("Employee")
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView()
            .previewTheme(for: .light)
    }
}
