//
//  AppRootInteractor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Combine
import Foundation
import SwiftUI

final class AppRootInteractor: Interactor, AppRootInteracting {
    // MARK: - Injection

    @Inject(\.carouselInteractor) var carouselInteractor

    // MARK: - Routing

    @Inject(\.router) var router
    @Inject(\.contractFactory) var contract

    // MARK: - Properties

    // MARK: - Lifecycle

    override func setup() {
        super.setup()
        router.navigate(to: contract.routeToNavigationRoot)
    }

    // MARK: - View interaction

    func closeCarouselOverlay() {
        carouselInteractor.closeCarouselOverlay()
    }
}
