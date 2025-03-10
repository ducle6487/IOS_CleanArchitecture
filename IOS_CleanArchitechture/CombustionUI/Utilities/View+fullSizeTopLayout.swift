//
//  View+fullSizeTopLayout.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public extension View {
    func fullSizeTopLayout() -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
