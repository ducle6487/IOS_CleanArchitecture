//
//  NewsInteracting.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public protocol NewsInteracting: Interacting, DeeplinkHandler {

}

// MARK: - Dependency registration
extension DependencyMap {
    private struct NewsInteractorKey: DependencyKey {
        static var dependency: any NewsInteracting = NewsInteractor()
    }

    public var newsInteractor: any NewsInteracting {
        get { resolve(key: NewsInteractorKey.self) }
        set { register(key: NewsInteractorKey.self, dependency: newValue) }
    }
}
