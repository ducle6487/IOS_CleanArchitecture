//
//  ListCell.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

struct ListCell<Content: View>: View {
    typealias CellAction = () -> Void
    
    @EnvironmentObject private var theme: ThemeProvider
    var content: Content
    var action: CellAction?
    var actionChevron: Bool = false
    var backgroundColor: Color?
    var destination: (() -> AnyView)?
    
    @State var childSize: CGSize = .init(width: 1, height: 50)
    
    /// Init that provides an autoclosure for clean call site
    init(
        action: @autoclosure @escaping CellAction,
        chevron: Bool = false,
        backgroundColor: Color? = nil,
        content: () -> Content
    ) {
        self.action = action
        self.actionChevron = chevron
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    /// Init that takes a nullable action for cell items without an action or
    init(
        action: CellAction? = nil,
        chevron: Bool = false,
        backgroundColor: Color? = nil,
        content: () -> Content
    ) {
        self.action = action
        self.actionChevron = chevron
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    /// Init that takes a destination for cell items without an action or
    init(
        destination: some View,
        backgroundColor: Color? = nil,
        content: () -> Content
    ) {
        self.destination = { AnyView(destination) }
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    var body: some View {
        ChildGeometryReader(size: $childSize) {
            Group {
                if let action {
                    // Only render button if action exists
                    Button(action: action) {
                        cell
                    }
                } else {
                    cell
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: childSize.height)
    }
    
    @ViewBuilder
    var cell: some View {
        // Register navlink if destination exists
        if let destination {
            NavigationLink(destination: destination) {
                ZStack {
                    backgroundColor ?? theme.colors.background
                    cellContent
                }
            }
        } else {
            ZStack {
                backgroundColor ?? theme.colors.background
                cellContent
            }
        }
    }
    
    var cellContent: some View {
        HStack(alignment: .center, spacing: theme.spacing.cozy) {
            content
            Spacer()
            if destination != nil || actionChevron {
                Image(systemName: "chevron.right")
                    .font(.subheadline)
                    .padding(.trailing, theme.spacing.cozy)
                    .foregroundColor(theme.colors.onSurface)
                    .opacity(0.6)
            }
        }
        .foregroundColor(theme.colors.onSurface)
        .padding(.leading, theme.spacing.comfortable)
        .padding(.vertical, theme.spacing.comfortable)
    }
}

// MARK: - Previews

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack(content: {
            Spacer()
            ListCell(action: {}) {
                CombustionText(text: "Some content")
            }
            Spacer()
        })
        .background(.white)
        .previewTheme(for: .light)
    }
}
