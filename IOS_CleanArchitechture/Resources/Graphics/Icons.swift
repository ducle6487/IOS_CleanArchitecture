//
//  Icons.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public enum Icons {
    public enum System {
        public static let checkmark = Image(systemName: "checkmark")
        public static let cross = Image(systemName: "xmark")
        public static let arrowRight = Image(systemName: "arrow.right")
        public static let share = Image(systemName: "square.and.arrow.up")
    }

    public enum App {
        public static let cross = Image("cross")
        public static let rightArrow = Image("right.arrow")
    }

    public enum Home {
        public static let search = Image("home_search")
        public static let friend = Image("home_friend")
        public static let add = Image("home_add")
        public static let chat = Image("home_chat")
        public static let profile = Image("home_profile")
    }
}
