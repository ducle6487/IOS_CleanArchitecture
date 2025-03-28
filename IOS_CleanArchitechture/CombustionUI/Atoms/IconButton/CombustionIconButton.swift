//
//  CombustionIconButton.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 27/3/25.
//

import SwiftUI

public typealias IconButtonAction = () -> Void

public struct CombustionIconButton: View {
    @EnvironmentObject private var theme: ThemeProvider
    @Inject(\.analytics) var analytics
    
    // MARK: - Instance Properties

    public var icon: CombustionImage?
    public var isEnabled: Bool
    public var isLoading: Bool
    public var type: CombustionIconButtonType
    public var event: String?
    public var eventParameters: AnalyticsEventParameters
    public var action: IconButtonAction
    
    // MARK: - Icon Button Lifecycle
        
    /// Custom round button
    ///
    /// Button component that can be reused throughout the application. Actions willl be completed
    /// in the onPress event of the button.
    ///
    /// - Parameters:
    ///   - icon: Icon for button.
    ///   - type: `CombustionIconButtonType` to determine style of button
    ///   - event: Optional analytics event to trigger on interaction with the button
    ///   - eventParameters: Optional analytics event parameters to be set in event on interaction with the button button
    ///   - enabled: Optional binding of the enabled state of the button to the Store
    ///   - loading: Optional binding of the loading state of the button to the Store
    ///   - action: Action closure that will be triggered on click
    public init(
        icon: CombustionImage?,
        type: CombustionIconButtonType = .primary,
        event: String? = nil,
        eventParameters: AnalyticsEventParameters = [:],
        enabled isEnabled: Bool = true,
        loading isLoading: Bool = false,
        action: @escaping IconButtonAction
    ) {
        self.icon = icon
        self.type = type
        self.event = event
        self.eventParameters = eventParameters
        self.isEnabled = isEnabled
        self.isLoading = isLoading
        self.action = action
    }
    
    public var body: some View {
        // Forward button action closure to on click
        Button(action: {
            action()
            // Log our button interactions
            if let event { analytics.log(event: event, parameters: eventParameters) }
        }) {
            buttonBody
        }
        // Disable our button if it is loading aswell as disabled state
        .disabled(!isEnabled || isLoading)
    }
}

// MARK: - Stateful color properties

extension CombustionIconButton {
    var backgroundColor: Color {
        switch type {
        case .custom(_, let backgroundColor):
            backgroundColor
        default:
            type.backgroundColor(for: theme, enabled: isEnabled)
        }
    }
    
    var textColor: Color {
        switch type {
        case .custom(let textColor, _):
            textColor
        default:
            type.textColor(for: theme, enabled: isEnabled)
        }
    }
}

// MARK: - Button Content

extension CombustionIconButton {
    var buttonBody: some View {
        // Stack our content and progress bar so that our
        // content is centered
        // Using just an HStack here off centers the text
        // when a progress view is visible
        ZStack {
            if isLoading {
                loadingStack
            } else {
                Group {
                    buttonContent
                }
                .padding(theme.spacing.compact)
            }
        }
        .frame(height: 40)
        .background(backgroundColor)
        .cornerRadius(theme.radius.large, antialiased: true)
    }
    
    var buttonContent: some View {
        icon
            .frame(width: 24, height: 24)
    }
    
    var loadingStack: some View {
        ProgressView()
            .progressViewStyle(
                CircularProgressViewStyle(
                    tint: textColor
                )
            )
            .frame(width: 24, height: 24)
            .padding(theme.spacing.compact)
    }
}

// MARK: - Autoclosure convenience

public extension CombustionIconButton {
    init(
        icon: CombustionImage?,
        type: CombustionIconButtonType = .primary,
        event: String? = nil,
        eventParameters: AnalyticsEventParameters = [:],
        enabled isEnabled: Bool = true,
        loading isLoading: Bool = false,
        action: @autoclosure @escaping IconButtonAction
    ) {
        self.icon = icon
        self.type = type
        self.event = event
        self.eventParameters = eventParameters
        self.isEnabled = isEnabled
        self.isLoading = isLoading
        self.action = action
    }
}

// MARK: - Previews

struct CombustionIconButton_Previews: PreviewProvider {
    static var previews: some View {
        // MARK: Primary buttons
        
        VStack {
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .custom(backgroundColor: .white.opacity(0.1)),
                enabled: true,
                loading: false,
                action: {}
            )
            .background(BlurView(style: .dark)
                .cornerRadius(10)
            )
        }
        .padding()
        .previewTheme(for: .light)

        VStack {
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.rightArrow, resizable: true),
                type: .primary,
                enabled: true,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.rightArrow, resizable: true),
                type: .primary,
                enabled: true,
                loading: true,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.rightArrow, resizable: true),
                type: .primary,
                enabled: false,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.rightArrow, resizable: true),
                type: .primary,
                enabled: false,
                loading: true,
                action: {}
            )
        }
        .padding()
        .previewTheme(for: .light)
            
        // MARK: Secondary buttons

        VStack {
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .secondary,
                enabled: true,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .secondary,
                enabled: true,
                loading: true,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .secondary,
                enabled: false,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .secondary,
                enabled: false,
                loading: true,
                action: {}
            )
        }
        .padding()
        .previewTheme(for: .light)
        
        // MARK: Ternary buttons

        VStack {
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .tertiary,
                enabled: true,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .tertiary,
                enabled: true,
                loading: true,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .tertiary,
                enabled: false,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .tertiary,
                enabled: false,
                loading: true,
                action: {}
            )
        }
        .padding()
        .previewTheme(for: .light)
        
        // MARK: Primary text only buttons

        VStack {
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .primaryTextOnly,
                enabled: true,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .primaryTextOnly,
                enabled: false,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .primaryTextOnly,
                enabled: true,
                loading: true,
                action: {}
            )
        }
        .padding()
        .previewTheme(for: .light)
        
        // MARK: Secondary text only buttons

        VStack {
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .secondaryTextOnly,
                enabled: true,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .secondaryTextOnly,
                enabled: false,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .secondaryTextOnly,
                enabled: true,
                loading: true,
                action: {}
            )
        }
        .background(Color.blue)
        .padding()
        .previewTheme(for: .light)
        
        // MARK: Ternary text only buttons

        VStack {
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .tertiaryTextOnly,
                enabled: true,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .tertiaryTextOnly,
                enabled: false,
                loading: false,
                action: {}
            )
            
            CombustionIconButton(
                icon: CombustionImage(image: Icons.App.cross, resizable: true),
                type: .tertiaryTextOnly,
                enabled: true,
                loading: true,
                action: {}
            )
        }
        .background(Color.blue)
        .padding()
        .previewTheme(for: .light)
    }
}
