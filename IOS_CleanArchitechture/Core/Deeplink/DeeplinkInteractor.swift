//
//  DeeplinkInteractor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public protocol DeeplinkInteracting: Interactor {
    func deeplink(to deeplink: Deeplink)
    func deeplink(to string: String)
    func resolveDeeplink(from string: String) throws -> Deeplink
}

class EmptyDeeplinkInteractor: Interactor, DeeplinkInteracting {
    func deeplink(to deeplink: Deeplink) {
        fatalError("Provide your own instance of a deeplink interactor")
    }

    func deeplink(to string: String) {
        fatalError("Provide your own instance of a deeplink interactor")
    }

    func resolveDeeplink(from string: String) throws -> Deeplink {
        fatalError("Provide your own instance of a deeplink interactor")
    }
}

extension DependencyMap {
    private struct DeeplinkInteractorKey: DependencyKey {
        static var dependency: any DeeplinkInteracting = EmptyDeeplinkInteractor()
    }

    public var deeplinking: any DeeplinkInteracting {
        get { resolve(key: DeeplinkInteractorKey.self) }
        set { register(key: DeeplinkInteractorKey.self, dependency: newValue) }
    }
}
