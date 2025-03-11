//
//  MapsStoring.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 11/3/25.
//

import MapKit

public protocol MapsStoring: Store {
    var initLocation: MKCoordinateRegion { get set }
    var locations: [MapLocationModel] { get set }
    var locationManager: CLLocationManager? { get set }
}

// MARK: - Dependency registration

extension DependencyMap {
    private struct MapsStoreKey: DependencyKey {
        static var dependency: any MapsStoring = MapsStore()
    }

    public var mapsStore: any MapsStoring {
        get { resolve(key: MapsStoreKey.self) }
        set { register(key: MapsStoreKey.self, dependency: newValue) }
    }
}
