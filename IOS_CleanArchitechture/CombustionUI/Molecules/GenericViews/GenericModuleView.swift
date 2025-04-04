//
//  GenericModuleView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

// MARK: Generic Module View

public struct GenericModuleView: View {
    @EnvironmentObject var theme: ThemeProvider

    var title: String
    var description: String?
    var button: CombustionButton?
    var image: CombustionImage?

    public init(
        title: String,
        description: String? = nil,
        button: CombustionButton? = nil,
        image: CombustionImage? = nil
    ) {
        self.title = title
        self.description = description
        self.button = button
        self.image = image
    }

    public var body: some View {
        VStack(spacing: theme.spacing.roomy) {
            if let image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
            }
            VStack(spacing: theme.spacing.squishy) {
                title(title)
                if let description {
                    descriptionText(description)
                }
            }
            button
        }
        .frame(maxWidth: .infinity)
    }

    func title(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .bold()
            .multilineTextAlignment(.center)
    }

    func descriptionText(_ text: String) -> some View {
        Text(text)
            .font(.caption)
            .multilineTextAlignment(.center)
    }
}

struct GenericModuleView_Previews: PreviewProvider {
    static var previews: some View {
        Page {
            VStack {
                GenericModuleView(
                    title: "No internet connection",
                    description: "Turn back on your internet and try again",
                    button: CombustionButton(title: "Refresh") {},
                    image: Images.App.lalapok.combustionImage()
                )
            }
        }
        .previewTheme(for: .light)
    }
}
