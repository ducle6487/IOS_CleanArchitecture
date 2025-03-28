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
                    HStack {
                        Icons.App.cross.combustionImage()
                        CombustionText(text: "Some text")
                    }
                }
                CombustionListItem {
                    CombustionText(text: "Some text")
                }
            }

            CombustionListSection {
                CombustionText(text: "header")
                    .font(.caption.weight(.semibold))
            } content: {
                CombustionListItem(action: {}) {
                    CombustionText(text: "Some text")
                }
            }

            CombustionListItem {
                CombustionText(text: "Some text")
            }
        }
        .previewTheme(for: .light)
    }
}
