//
//  HalfSheetView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

struct HalfSheetView<Content: View>: View {
    @EnvironmentObject private var theme: ThemeProvider
    @State private var contentSize: CGSize = .init(width: 1, height: 1)
    @GestureState private var dragged: CGFloat = 0
    private var maxDragBigger: CGFloat = 30
    @Binding var isPresented: Bool
    var onDismiss: () -> Void
    var content: Content
    
    init(
        isPresented: Binding<Bool>,
        onDismiss: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // background greyed behind sheet
            BlurView(style: .dark)
                .opacity(isPresented ? 0.6 : 0)
                .allowsHitTesting(isPresented)
                .animation(theme.motion.easeInOutMedium, value: isPresented)
                .onTapGesture {
                    onDismiss()
                    isPresented = false
                }
//            Color.black
//                .background(.ultraThinMaterial)
//                .allowsHitTesting(isPresented)
//                .opacity(isPresented ? 0.2 : 0)
//                .blur(radius: 10)
//                .animation(theme.motion.easeInOutMedium, value: isPresented)
//                .onTapGesture {
//                    // Close sheet on tap outside and trigger dismiss
//                    onDismiss()
//                    isPresented = false
//                }
            
            // Transalte our sheet based on presentation state
            sheet
                .offset(y: max(offset + dragged, 0))
                .animation(theme.motion.easeOutMedium, value: isPresented)
                .animation(theme.motion.easeOutMedium, value: dragged)
                .animation(theme.motion.easeOutMedium, value: offset)
                .gesture(
                    DragGesture().updating($dragged) { value, state, _ in
                        state = value.translation.height
                    }
                    .onEnded { value in
                        // User must drag more than a quarter to dismiss
                        guard value.translation.height > contentSize.height / 4 else { return }
                        onDismiss()
                        self.isPresented = false
                    }
                )
        }
        .ignoresSafeArea()
    }
    
    var offset: CGFloat {
        // Offset by at least 600 (avoid a jumping bug when content size changes)
        isPresented ? maxDragBigger : max(contentSize.height, 600)
    }
}

extension HalfSheetView {
    var sheet: some View {
        VStack(spacing: 0) {
            content
                .padding(.top, 24)
                .frame(maxWidth: .infinity)
                .background(
                    ChildGeometryReader(size: $contentSize) {
                        Color.clear.ignoresSafeArea()
                    }
                )
                .background(theme.colors.background)
                .cornerRadius(theme.radius.extraLarge, corners: [.topLeft, .topRight])
                .overlay(alignment: .top) {
                    VStack {
                        Rectangle()
                            .frame(width: 48, height: 4)
                            .background(.clear)
                            .foregroundStyle(theme.colors.onSecondary)
                            .cornerRadius(theme.radius.small)
                            .padding()
                    }
                    .frame(height: 24)
                }
            
            theme.colors.background
                .frame(height: maxDragBigger)
        }
    }
}

struct HalfSheetView_Previews: PreviewProvider {
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
                
                HalfSheetView(isPresented: $isPresented, onDismiss: {}) {
                    VStack {
                        Spacer()
                        Text("Search")
                            .foregroundStyle(.white)
                        Spacer()
                        
                        CombustionButton(title: "Cancel", type: .secondary, action: {
                            isPresented = false
                        })
                    }
                    .background(.clear)
                    .padding()
                    .frame(height: 400)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    static var previews: some View {
        Wrapper()
            .previewTheme(for: .light)
    }
}
