//
//  PCarouselInteractor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

public protocol PCarouselInteractor: Interactor {
    func openCarouselItem(_ item: CarouselItem)
    func closeCarouselOverlay()
}

// MARK: - Dependency registration

extension DependencyMap {
    private struct CarouselInteractorKey: DependencyKey {
        static var dependency: any PCarouselInteractor = CarouselInteractor()
    }

    public var carouselInteractor: any PCarouselInteractor {
        get { resolve(key: CarouselInteractorKey.self) }
        set { register(key: CarouselInteractorKey.self, dependency: newValue) }
    }
}
