//
//  Icons.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public enum Icons {
    public enum System {
        public static let checkmark: some View = Image(systemName: "checkmark")
            .font(.system(size: 17, weight: .semibold))
        public static let cross = Image(systemName: "xmark")
        public static let arrowRight = Image(systemName: "arrow.right")
        public static let share = Image(systemName: "square.and.arrow.up")
    }

    public enum Tabs {
        public static let home = Image("home")
        public static let homeSelected = Image("home_selected")
    }
}
