//
//  CarouselStore.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

final class CarouselStore: Store, PCarouselStore {
    // MARK: - Injection

    // MARK: - Routing

    // MARK: - Instance properties

    @Published var isOverlayPresented: Bool = false
    @Published var currentPresentedCarouselItem: CarouselItem?

    // MARK: - Lifecycle

    override func setup() {
        super.setup()
    }

    // MARK: - Updates

    func presentCarouselOverlay(with carouselItem: CarouselItem) {
        currentPresentedCarouselItem = carouselItem
        isOverlayPresented = true
    }

    func closeCarouselOverlay() {
        currentPresentedCarouselItem = nil
        isOverlayPresented = true
    }
}
