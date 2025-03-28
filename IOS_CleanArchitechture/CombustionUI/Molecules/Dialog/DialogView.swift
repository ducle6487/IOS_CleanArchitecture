//
//  DialogView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 26/3/25.
//

import SwiftUI

struct DialogView: View {
    @EnvironmentObject private var theme: ThemeProvider
    @State private var contentSize: CGSize = .init(width: 1, height: 1)
    @Binding var isPresented: Bool
    @State private var offset: CGFloat = 1000 // Start off-screen

    var content: DialogContent

    init(
        isPresented: Binding<Bool>,
        content: DialogContent
    ) {
        self._isPresented = isPresented
        self.content = content
    }

    var body: some View {
        ZStack {
            if isPresented {
                BlurView(style: .dark)
                    .opacity(isPresented ? 0.6 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            offset = 1000 // Move off-screen before dismissing
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isPresented = false
                        }
                    }

                VStack(spacing: theme.spacing.comfortable) {
                    if content.type == .custom {
                        content.customContent
                    } else {
                        buildNormalContent()
                    }

                    HStack(spacing: theme.spacing.compact) {
                        CombustionButton(
                            title: content.noTitle,
                            type: .tertiary,
                            enabled: true,
                            loading: false,
                            action: {
                                withAnimation(.spring()) {
                                    offset = 1000 // Move off-screen before dismissing
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    isPresented = false
                                }
                            }
                        )

                        CombustionButton(
                            title: content.yesTitle,
                            type: .primary,
                            enabled: true,
                            loading: false,
                            action: {
                                withAnimation(.spring()) {
                                    offset = 1000 // Move off-screen before dismissing
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    isPresented = false
                                }
                            }
                        )
                    }
                    .padding(.top, theme.spacing.compact)
                }
                .padding()
                .background(theme.colors.background)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, theme.spacing.spacious)
                .offset(y: offset) // Apply offset for animation
                .onAppear {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        offset = 0
                    }
                }
                .onDisappear {
                    // Removed abrupt movement
                }
            }
        }
    }

    @ViewBuilder
    func buildNormalContent() -> some View {
        VStack(spacing: theme.spacing.comfortable) {
            CombustionText(text: content.title)
                .padding(.top, theme.spacing.compact)
                .font(.title3.weight(.heavy))
                .multilineTextAlignment(.center)

            Text(content.description)
                .font(.footnote.weight(.semibold))
                .foregroundStyle(theme.colors.onSecondary)
                .multilineTextAlignment(.center)
        }
    }
}

struct DialogView_Previews: PreviewProvider {
    struct Wrapper: View {
        @State var isPresented: Bool = false

        var body: some View {
            ZStack {
                Color.white.ignoresSafeArea()
                Button(action: {
                    isPresented.toggle()
                }) {
                    Text("Click me")
                }

                DialogView(isPresented: $isPresented,
                           content: DialogContent(title: "Quit Editing?",
                                                  description: "If you go back now, you will lose any changes you’ve made",
                                                  yesTitle: "Delete",
                                                  noTitle: "Cancel",
                                                  yesAction: {}))
            }
        }
    }

    static var previews: some View {
        Wrapper()
            .previewTheme(for: .light)
    }
}

public struct DialogContent {
    public var title: String
    public var description: String
    public var customContent: AnyView // ✅ Store as AnyView
    public var type: CombustionDialogType
    public var event: String?
    public var eventParameters: AnalyticsEventParameters
    public var yesTitle: String
    public var noTitle: String
    public var yesAction: ButtonAction?
    public var noAction: ButtonAction?

    public init(
        title: String = "",
        description: String = "",
        @ViewBuilder customContent: @escaping () -> some View = { EmptyView() }, // ✅ Accept as @ViewBuilder
        type: CombustionDialogType = .normal,
        event: String? = nil,
        eventParameters: AnalyticsEventParameters = [:],
        yesTitle: String = "Accept",
        noTitle: String = "Cancel",
        yesAction: ButtonAction? = nil,
        noAction: ButtonAction? = nil
    ) {
        self.title = title
        self.description = description
        self.customContent = AnyView(customContent()) // ✅ Convert to AnyView
        self.type = type
        self.event = event
        self.eventParameters = eventParameters
        self.yesTitle = yesTitle
        self.noTitle = noTitle
        self.yesAction = yesAction
        self.noAction = noAction
    }
}
