//
//  SpacingTokens.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Foundation

enum SpacingTokens {
    /// Smallest spacing used in small related components i.e. Spacing around an image in a small box
    static let tight: CGFloat = TShirtTokens.xxxSmall
    /// Minor spacing between related components, i.e. Title and description
    static let squishy: CGFloat = TShirtTokens.xxSmall
    /// Spacing between related groups of components, i.e. An image above a text block
    static let compact: CGFloat = TShirtTokens.xSmall
    /// Default spacing for internal insets and spacing within components
    static let cozy: CGFloat = TShirtTokens.small
    /// Default spacing and margin for pages and component gutters
    static let comfortable: CGFloat = TShirtTokens.medium
    /// Spacing between larger components or clearly separating unrelated components from each other
    static let roomy: CGFloat = TShirtTokens.large
    /// Are we sure we even need this?
    static let spacious: CGFloat = TShirtTokens.xLarge
}
