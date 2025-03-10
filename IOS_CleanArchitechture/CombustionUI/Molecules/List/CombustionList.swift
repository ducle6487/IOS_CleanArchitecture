//
//  CombustionList.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public struct CombustionList<Content: View>: View {
    @EnvironmentObject private var theme: ThemeProvider
    var content: Content

    public init(@CombustionListBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: theme.spacing.comfortable) {
            content
        }
    }
}

// MARK: - Previews

struct CombustionList_Previews: PreviewProvider {
    static var previews: some View {
        CombustionList {
            CombustionListSection {
                CombustionListItem(action: {}) {
                    Text("Some text")
                }
                CombustionListItem {
                    Text("Some text")
                }
            }

            CombustionListSection {
                CombustionListItem(action: {}) {
                    Text("Some text")
                }
                CombustionListItem {
                    Text("Some text")
                }
            }
        }
        .previewTheme(for: .light)
    }
}
