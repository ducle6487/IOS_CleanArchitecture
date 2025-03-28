//
//  Toast.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 27/3/25.
//

//
//  DialogView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 26/3/25.
//

import SwiftUI

struct ToastView: View {
    @EnvironmentObject private var theme: ThemeProvider
    @State private var contentSize: CGSize = .init(width: 1, height: 1)
    @Binding var isPresented: Bool
    @State private var offset: CGFloat = 1000 // Start off-screen

    var message: String

    init(
        isPresented: Binding<Bool>,
        message: String
    ) {
        self._isPresented = isPresented
        self.message = message
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            if isPresented {
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    CombustionText(text: message)
                        .padding(.vertical, theme.spacing.cozy)
                        .padding(.horizontal, theme.spacing.comfortable)
                        .font(.callout)
                        .background(theme.colors.background)
                        .clipShape(RoundedRectangle(cornerRadius: TShirtTokens.xSmall))
                        .offset(y: offset) // Apply offset for animation
                        .onAppear {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                offset = 0
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    offset = 1000
                                    isPresented = false
                                }
                            }
                        }
                        .onDisappear {
                            // Removed abrupt movement
                        }
                    Spacer()
                }
            }
        }
    }
}

struct ToastView_Previews: PreviewProvider {
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

                ToastView(isPresented: $isPresented, message: "Toast message")
            }
        }
    }

    static var previews: some View {
        Wrapper()
            .previewTheme(for: .light)
    }
}
