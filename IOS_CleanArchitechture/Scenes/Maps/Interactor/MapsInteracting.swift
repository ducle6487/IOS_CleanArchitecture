//
//  MapsInteracting.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public protocol MapsInteracting: Interacting, DeeplinkHandler {
    func checkIfLocationEnabled()
}

// MARK: - Dependency registration

extension DependencyMap {
    private struct MapsInteractorKey: DependencyKey {
        static var dependency: any MapsInteracting = MapsInteractor()
    }

    public var mapsInteractor: any MapsInteracting {
        get { resolve(key: MapsInteractorKey.self) }
        set { register(key: MapsInteractorKey.self, dependency: newValue) }
    }
}
