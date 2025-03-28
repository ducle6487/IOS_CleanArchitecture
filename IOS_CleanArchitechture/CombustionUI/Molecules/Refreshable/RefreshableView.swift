//
//  RefreshableView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public struct RefreshableView<Content: View>: View {
    @EnvironmentObject private var theme: ThemeProvider
    var content: Content
    var onRefresh: () async -> Void

    @StateObject var scrollDelegate = PullRefreshGestureDelegate()
    @State var isPlaying: Bool = true
    @State var loadingAnimation: AnimatedImage?
    @State var pullAnimation: AnimatedImage?

    public init(@ViewBuilder content: () -> Content, onRefresh: @escaping () async -> Void) {
        self.content = content()
        self.onRefresh = onRefresh
    }

    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                content
                    .frame(maxWidth: .infinity)
                    .offset(
                        y: scrollDelegate.canRefresh
                            ? scrollDelegate.offset - scrollDelegate.contentOffset
                            : 0
                    )
                    // Load our pull to refresh animation
                    .swallowTask { @MainActor in
                        self.loadingAnimation = try await AnimatedImage.loadedFrom(url: URL(string: "https://lottie.host/c956b8dd-0410-4b1d-8b41-580efea6077b/EPA9QX7rZS.lottie")!)
                        self.pullAnimation = try await AnimatedImage.loadedFrom(url: URL(string: "https://lottie.host/c956b8dd-0410-4b1d-8b41-580efea6077b/EPA9QX7rZS.lottie")!)
                    }
                    .offset(coordinateSpace: "refresh") { offset in
                        // Animate the growing of our refresh view above our scrollview
                        scrollDelegate.contentOffset = offset

                        // Offset our refresh view based on refresh state and progress
                        if !scrollDelegate.canRefresh {
                            var progress = offset / PullRefreshGestureDelegate.maxDrag
                            progress = max(progress, 0)
                            progress = min(progress, 1)
                            scrollDelegate.progress = progress
                            scrollDelegate.offset = offset
                        } else {
                            // If the we are refreshing set the height of our refresh view
                            withAnimation {
                                scrollDelegate.offset = PullRefreshGestureDelegate.maxDrag
                            }
                        }
                    }
            }
        }
        .coordinateSpace(name: "refresh")
        // Handle multiple gestures at the same time whilst not
        // interfering with the scrollView gestures
        .onAppear(perform: scrollDelegate.addGesture)
        .onDisappear(perform: scrollDelegate.removeGesture)
        // Trigger our refresh when our delegate is released
        .onChange(of: scrollDelegate.canRefresh) { canRefresh in
            if canRefresh {
                Task {
                    // Trigger our refresh and wait for it to finish
                    await onRefresh()

                    // Animate the closing of our refresh animation
                    withAnimation(theme.motion.easeInOutSlow) {
                        scrollDelegate.offset = 0
                        DispatchQueue.main.asyncAfter(deadline: .now() + .delaySlow) {
                            scrollDelegate.canRefresh = false
                        }
                    }
                }
            }
        }
        .background(
            VStack {
                Group {
                    if loadingAnimation != nil && scrollDelegate.canRefresh {
                        AnimatedImageView(animation: loadingAnimation, playing: $isPlaying, loopMode: .loop)
                    } else if pullAnimation != nil {
                        AnimatedImageView(animation: pullAnimation, playing: $isPlaying)
                    }
                }
                .padding(theme.spacing.cozy)
                .frame(maxWidth: .infinity)
                .frame(height: max(scrollDelegate.offset, 0))
//                .background(theme.colors.background)
                .clipped()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        )
    }
}

// MARK: - Previews

struct RefreshableView_Previews: PreviewProvider {
    static var previews: some View {
        RefreshableView {
            Text("Test")
        } onRefresh: {
            try? await Task.sleep(seconds: 2)
            print("Refreshed")
        }
        .previewTheme(for: .light)
    }
}
