//
//  Untitled.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

// MARK: - Color definitions

public enum ColorTokens {
    // MARK: - Neutrals

    public enum Neutrals {
        public static let white = Color.white
        public static let lightGrey = Color(0xf5f5f5)
        public static let grey = Color(0xdbdbdb)
        public static let darkGrey = Color(0x76777a)
        public static let lpgGrey = Color(0xd9d8d6)
    }

    public enum Blacks {
        public static let black = Color(0x202020)
        public static let black80 = Color(0x373737)
        public static let black70 = Color(0x5c5c5c)
        public static let black60 = Color(0x636363)
        public static let black30 = Color(0x949494)
        public static let black20 = Color(0xb8b8b8)
        public static let black10 = Color(0xdbdbdb)
        public static let blackOver = Color(0x424242)
        public static let dieselBlack = Color(0x24272a)
    }

    public enum Reds {
        public static let red = Color(0xed0c06)
        public static let red60 = Color(0xf46d6a)
        public static let red30 = Color(0xf9b6b4)
        public static let red10 = Color(0xfde6e6)
    }

    public enum Oranges {
        public static let edrOrange = Color(0xfd6400)
    }

    public enum Blues {
        public static let blue = Color(0x18249c)
        public static let blue60 = Color(0x747cc4)
        public static let blue30 = Color(0xb9bde1)
        public static let blue10 = Color(0xe7e9f5)
        public static let blueOver = Color(0x141e84)
        public static let electricityBlue = Color(0x1860d8)
        public static let electricityBlue60 = Color(0x74a0e8)
        public static let electricityBlue30 = Color(0xbacff3)
        public static let electricityBlue10 = Color(0xe8effb)
        public static let electricityBlueOver = Color(0x1656c2)
        public static let adblueBlue = Color(0x00a7e1)
        public static let darkBlue = Color(0x3a34ce)
    }

    public enum Greens {
        public static let brightChartreuse = Color(0xdbff10)
    }

    public enum Purples {
        public static let purple = Color(0x70189c)
    }

    public enum AngularGradient {
        public static let orange = Color(0xff6b27)
        public static let yellow = Color(0xffa62b)
        public static let cyan = Color(0x97f8ff)
        public static let purple = Color(0xa98cff)
        public static let pink = Color(0xff66a8)
    }
}
