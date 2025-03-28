//
//  MapsView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import MapKit
import SwiftUI

public struct MapsView: View {
    // MARK: Injection

    @InjectObservable(\.mapsStore) var store
    @InjectObservable(\.router) var router

    // MARK: Properties

    @EnvironmentObject private var theme: ThemeProvider
    @State private var isShowToolBarMenu: Bool = false
    private var bottomToolBarMenuAnimation: Animation = .spring(duration: 0.75, bounce: 0.2)
    @State private var isTapped = (Image(""), false)

    public var body: some View {
        ZStack {
            map

            if isShowToolBarMenu {
                bottomToolBarMenu
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }

//            VStack {
//                CombustionButton(title: "dialog", wrapContent: true) {
//                    router.showDialog(with: DialogContent(title: "Quit Editing?",
//                                                          description: "If you go back now, you will lose any changes you’ve made",
//                                                          yesTitle: "Delete",
//                                                          noTitle: "Cancel",
//                                                          yesAction: {})
//                    )
//                }
//                CombustionButton(title: "toast", wrapContent: true) {
//                    router.showToast(with: "Toasted!!!")
//                }
//                CombustionButton(title: "toast 2", wrapContent: true) {
//                    router.showToast(with: "Toast 2")
//                }
//            }
        }
        .onAppear {
            withAnimation(bottomToolBarMenuAnimation) {
                isShowToolBarMenu = true
            }
        }
    }

    // MARK: Content

    var map: some View {
        Map(coordinateRegion: $store.initLocation, showsUserLocation: true, annotationItems: store.locations) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                ZStack {
                    RoundedCorner()
                        .fill(Color.red.opacity(0.5))
                        .frame(width: 100, height: 100)

                    CombustionImage(image: Image(systemName: "mappin"), resizable: false)
                        .frame(width: 20, height: 20)
                }
            }
        }
        .ignoresSafeArea()
    }

    var bottomToolBarMenu: some View {
        VStack {
            Spacer()
            ZStack {
                theme.colors.onPrimary.opacity(0.9)
                    .cornerRadius(theme.radius.large, antialiased: true)

                HStack(alignment: .center, spacing: theme.spacing.comfortable) {
                    Spacer()
                    toolBarItem(image: Icons.Home.search) {
                        router.openHalfSheet(with:
                            CombustionListSection {
                                CombustionListItem(action: {}) {
                                    HStack {
                                        Icons.App.cross.combustionImage()
                                        CombustionText(text: "Some text")
                                    }
                                }
                                CombustionListItem {
                                    CombustionText(text: "Some text")
                                }
                            }
                            .background(.clear)
                            .padding(.top)
                            .padding(.bottom, theme.spacing.spacious)
                        ) {
                            withAnimation(bottomToolBarMenuAnimation) {
                                isShowToolBarMenu = true
                            }
                        }
                    }
                    Spacer()
                    toolBarItem(image: Icons.Home.friend) {
                        router.openHalfSheet(with:
                            VStack {
                                Spacer()
                                Text("Friend")
                                    .foregroundStyle(.white)
                                Spacer()
                                CombustionButton(title: "Okay", action: {})
                                CombustionButton(title: "Cancel", type: .secondary, action: {})
                            }
                            .frame(height: 400)
                            .padding()

                        ) {
                            withAnimation(bottomToolBarMenuAnimation) {
                                isShowToolBarMenu = true
                            }
                        }
                    }
                    Spacer()
                    toolBarItem(isCenter: true, image: Icons.Home.add) {
                        router.openHalfSheet(with:
                            VStack {
                                Spacer()
                                Text("Add")
                                    .foregroundStyle(.white)
                                Spacer()
                                CombustionButton(title: "Okay", action: {})
                                CombustionButton(title: "Cancel", type: .secondary, action: {})
                            }
                            .frame(height: 400)
                            .padding()
                        ) {
                            withAnimation(bottomToolBarMenuAnimation) {
                                isShowToolBarMenu = true
                            }
                        }
                    }
                    Spacer()
                    toolBarItem(image: Icons.Home.chat) {
                        router.openHalfSheet(with:
                            VStack {
                                Spacer()
                                Text("Chat")
                                    .foregroundStyle(.white)
                                Spacer()
                                CombustionButton(title: "Okay", action: {})
                                CombustionButton(title: "Cancel", type: .secondary, action: {})
                            }
                            .frame(height: 400)
                            .padding()
                        ) {
                            withAnimation(bottomToolBarMenuAnimation) {
                                isShowToolBarMenu = true
                            }
                        }
                    }
                    Spacer()
                    toolBarItem(image: Icons.Home.profile) {
                        router.openHalfSheet(with:
                            VStack {
                                Spacer()
                                Text("Profile")
                                    .foregroundStyle(.white)
                                Spacer()
                                CombustionButton(title: "Okay", action: {})
                                CombustionButton(title: "Cancel", type: .secondary, action: {})
                            }
                            .frame(height: 400)
                            .padding()
                        ) {
                            withAnimation(bottomToolBarMenuAnimation) {
                                isShowToolBarMenu = true
                            }
                        }
                    }
                    Spacer()
                }
            }
            .frame(height: 48)
            .padding(.horizontal, theme.spacing.spacious)
            .padding(.vertical, theme.spacing.comfortable)
            .shadow(color: theme.colors.onPrimary.opacity(0.2), radius: 4, x: 0, y: 0)
        }
    }

    // MARK: Toolbar Item

    func toolBarItem(isCenter: Bool = false, image: Image, action: (() -> Void)?) -> some View {
        return image
            .onTapGesture {
                withAnimation(.spring(response: 0.25, dampingFraction: 0.5, blendDuration: 0.2)) {
                    isTapped = (image, true)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        isTapped = (image, false)
                    }
                    if let action = action {
                        withAnimation(bottomToolBarMenuAnimation) {
                            isShowToolBarMenu = false
                        }
                        action()
                    }
                }
            }
            .padding(isCenter ? theme.spacing.cozy / 2 : 0)
            .background(isCenter ? theme.colors.primary : .clear)
            .cornerRadius(isCenter ? theme.radius.large : 0, antialiased: true)
            .scaleEffect((isTapped.1 && isTapped.0 == image) ? 1.2 : 1.0) // Scale up when tapped
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
            .previewTheme(for: .light)
    }
}
