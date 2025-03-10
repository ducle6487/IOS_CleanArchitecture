//
//  CarouselInteractor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Combine

final class CarouselInteractor: Interactor, PCarouselInteractor {
    // MARK: - Injection

    @Inject(\.carouselStore) var store: any PCarouselStore

    // MARK: - Routing

    // MARK: - View interaction

    func openCarouselItem(_ item: CarouselItem) {
        store.presentCarouselOverlay(with: item)
    }

    func closeCarouselOverlay() {
        store.closeCarouselOverlay()
    }
}
