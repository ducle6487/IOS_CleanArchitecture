//
//  AngulaShadowView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 27/3/25.
//

import SwiftUI

struct RoundedAngulaShadowView: View {
    var content: AnyView
    @State var colors: [Color]?
    var size: CGFloat

    init(
        colors: [Color]? = nil, // Default colors
        size: CGFloat = 60,
        @ViewBuilder content: @escaping () -> some View = { EmptyView() }
    ) {
        self.colors = colors
        self.size = size
        self.content = AnyView(content())
    }

    var body: some View {
        ZStack {
            RoundedCorner()
                .fill(Gradient.angularGradientWithShadow(colors: colors))
                .frame(width: size, height: size)
                .blur(radius: 8)
                .opacity(0.6)

            content
                .frame(width: size, height: size)
        }
    }
}

struct RoundedAngulaShadowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RoundedAngulaShadowView(size: 88) {
                VStack(spacing: 0) {
                    ZStack {
                        RoundedCorner()
                            .fill(.white)
                            .frame(width: 60, height: 60)

                        RoundedCorner()
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 60, height: 60)
                    }
                    .padding(.top, 8)

                    RoundedCorner()
                        .frame(width: 4, height: 8)
                }
            }

            RoundedAngulaShadowView(colors: [ColorTokens.Greens.brightChartreuse], size: 75) {
                VStack(spacing: 0) {
                    ZStack {
                        RoundedCorner()
                            .fill(.white)
                            .frame(width: 60, height: 60)

                        RoundedCorner()
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: 60, height: 60)
                    }
                    .padding(.top, 8)

                    RoundedCorner()
                        .frame(width: 4, height: 8)
                }
            }
        }
    }
}
