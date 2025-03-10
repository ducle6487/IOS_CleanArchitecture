//
//  Events.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

enum Event {
    struct Screen {}

    enum Button {
        enum Tabs {
            static let tapNavHome = "tap_nav_home"
            static let tapNavEmployee = "tap_nav_employee"
            static let tapNavNews = "tap_nav_news"
            static let tapNavProfile = "tap_nav_profile"
        }
    }
}
