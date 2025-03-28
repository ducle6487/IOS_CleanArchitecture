//
//  CombustionToggleButtonGroup.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 28/3/25.
//

import Foundation
import SwiftUI

struct CombustionToggleButtonGroup: View {
    @EnvironmentObject var theme: ThemeProvider

    @Binding var preselectedIndex: Int
    var options: [String]

    init(preselectedIndex: Binding<Int>, options: [String]) {
        self._preselectedIndex = preselectedIndex
        self.options = options
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(options.indices, id: \.self) { index in
                    Text(options[index])
                        .font(.subheadline.bold())
                        .foregroundStyle(preselectedIndex == index ? theme.colors.onPrimary : theme.colors.onBackground)
                        .frame(height: 36)
                        .padding(.horizontal)
                        .background(preselectedIndex == index ? theme.colors.primary : .clear)
                        .cornerRadius(TShirtTokens.xSmall)
                        .contentShape(Rectangle())
                        .overlay(content: {
                            RoundedCorner(radius: TShirtTokens.xSmall)
                                .stroke(preselectedIndex == index ? .clear : theme.colors.onSurface)
                        })
                        .onTapGesture {
                            withAnimation(theme.motion.easeInOutSlow) {
                                preselectedIndex = index
                            }
                        }
                }
            }
            .padding()
        }
        .frame(height: 44)
    }
}

struct CombustionToggleButtonGroup_Previews: PreviewProvider {
    struct Wrapper: View {
        @State var preselectedIndex = 0
        private var datas = ["ssss", "asdadasadasda", "asdasdsadasdas", "ssss", "asdada", "asdasd", "ssss", "asdada", "asdasd"]

        var body: some View {
            VStack {
                CombustionToggleButtonGroup(preselectedIndex: $preselectedIndex,
                                            options: datas)
                CombustionText(text: "\(datas[preselectedIndex])")
            }
        }
    }

    static var previews: some View {
        Wrapper()
            .previewTheme(for: .light)
    }
}
