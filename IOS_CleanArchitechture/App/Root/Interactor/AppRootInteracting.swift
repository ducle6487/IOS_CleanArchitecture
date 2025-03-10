//
//  AppRootInteracting.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

protocol AppRootInteracting: Interactor {
    func closeCarouselOverlay()
}

// MARK: - Dependency registration

extension DependencyMap {
    
    private struct AppRootInteractorKey: DependencyKey {
        static var dependency: any AppRootInteracting = AppRootInteractor()
    }
    
    var appRootInteractor: any AppRootInteracting {
        get { resolve(key: AppRootInteractorKey.self) }
        set { register(key: AppRootInteractorKey.self, dependency: newValue) }
    }
}
