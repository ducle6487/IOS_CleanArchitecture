//
//  CombustionSegmentedControl.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 28/3/25.
//

import Foundation
import SwiftUI

struct CombustionSegmentedControl: View {
    @EnvironmentObject var theme: ThemeProvider

    @Binding var preselectedIndex: Int
    var options: [String]
    var width: CGFloat?
    var type: CombustionSegmentedControlType

    init(
        preselectedIndex: Binding<Int>,
        width: CGFloat? = nil,
        type: CombustionSegmentedControlType = .large,
        options: [String]
    ) {
        self._preselectedIndex = preselectedIndex
        self.type = type
        self.width = width
        self.options = options
    }

    var body: some View {
        GeometryReader { geometry in
            let fullWidth = (width ?? geometry.size.width) - 8
            let segmentWidth = fullWidth / CGFloat(options.count)

            ZStack(alignment: .center) {
                // Background
                Rectangle()
                    .fill(theme.colors.background)
                    .cornerRadius(theme.radius.large)

                ZStack(alignment: .leading) {
                    // Sliding Indicator
                    Rectangle()
                        .fill(theme.colors.primary)
                        .cornerRadius(TShirtTokens.xSmall)
                        .frame(width: segmentWidth, height: type == .large ? 36 : 24)
                        .offset(x: CGFloat(preselectedIndex) * segmentWidth)
                        .animation(theme.motion.easeInOutSlow, value: preselectedIndex)

                    HStack(alignment: .center, spacing: 0) {
                        ForEach(options.indices, id: \.self) { index in
                            Text(options[index])
                                .font(.subheadline.bold())
                                .foregroundStyle(preselectedIndex == index ? theme.colors.onPrimary : theme.colors.onBackground)
                                .frame(maxWidth: .infinity)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(theme.motion.easeInOutSlow) {
                                        preselectedIndex = index
                                    }
                                }
                        }
                    }
                }
                .frame(width: fullWidth)
            }
            .frame(width: fullWidth + 8)
        }
        .frame(width: width ?? .infinity, height: type == .large ? 44 : 32)
    }
}

struct CombustionSegmentedControl_Previews: PreviewProvider {
    struct Wrapper: View {
        @State var preselectedIndex = 0
        private var datas = ["Likes", "Views"]

        var body: some View {
            VStack(alignment: .center) {
                CombustionSegmentedControl(preselectedIndex: $preselectedIndex,
                                           type: .large,
                                           options: datas)
                    .padding()
                CombustionText(text: "\(datas[preselectedIndex])")

                CombustionSegmentedControl(preselectedIndex: $preselectedIndex,
                                           width: 120,
                                           type: .small,
                                           options: datas)
                    .padding()
            }
        }
    }

    static var previews: some View {
        Wrapper()
            .previewTheme(for: .light)
    }
}
