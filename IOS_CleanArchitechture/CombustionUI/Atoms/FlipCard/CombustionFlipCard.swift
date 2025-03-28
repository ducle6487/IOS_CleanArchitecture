//
//  CombustionFlipCard.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 28/3/25.
//

import SwiftUI

struct CombustionFlipCard: View {
    @EnvironmentObject var theme: ThemeProvider
    @State private var isFlipped = false

    var frontContent: AnyView
    var backContent: AnyView

    init(
        @ViewBuilder frontContent: @escaping () -> some View = { EmptyView() },
        @ViewBuilder backContent: @escaping () -> some View = { EmptyView() }
    ) {
        self.frontContent = AnyView(frontContent())
        self.backContent = AnyView(backContent())
    }

    var body: some View {
        ZStack {
            if isFlipped {
                backContent
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            } else {
                frontContent
            }
        }
        .cornerRadius(16)
        .shadow(radius: 5)
        .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation(.spring(duration: 0.6, bounce: 0.4)) {
                isFlipped.toggle()
            }
        }
    }
}

struct CombustionFlipCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0 ..< 5) { _ in
                        CombustionFlipCard(frontContent: {
                            VStack {
                                Image(systemName: "moon.stars.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.orange)
                                Text("Night Owl")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Check-in to 10+ locations during the night")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                            }
                            .padding()
                            .frame(width: 300, height: 400)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(16)
                        }, backContent: {
                            VStack {
                                Text("No. 0090-0024")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Image(systemName: "moon.stars.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.orange)
                                Text("Night Owl")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("Check-in to 10+ locations during the night")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Text("jennie.b won this badge on:")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text("02-18-2025")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .frame(width: 300, height: 400)
                            .background(Color.black)
                            .cornerRadius(16)
                        })
                    }
                    .padding()
                }
                .padding(.vertical, 50)
            }
        }
        .previewTheme(for: .light)
    }
}
