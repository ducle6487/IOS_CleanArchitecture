//
//  MapsStore.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 11/3/25.
//

import Combine
import Foundation
import MapKit

final class MapsStore: Store, MapsStoring {
    @Published var initLocation: MKCoordinateRegion = .init(center: CLLocationCoordinate2D(latitude: 10.772664336127484, longitude: 106.69795642783092),
                                                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @Published var locationManager: CLLocationManager?
    @Published var locations: [MapLocationModel] = [
        MapLocationModel(name: "Ben Thanh Market", latitude: 10.772664336127484, longitude: 106.69795642783092),
        MapLocationModel(name: "Nguyen Hue Walking Street", latitude: 10.776084118142617, longitude: 106.70170884445854)
    ]
}
