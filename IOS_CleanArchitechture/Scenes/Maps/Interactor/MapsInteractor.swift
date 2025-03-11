//
//  MapsInteractor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import MapKit

class MapsInteractor: Interactor, MapsInteracting, CLLocationManagerDelegate {
    @InjectObservable(\.mapsStore) var store

    override func setup() {
        checkIfLocationEnabled()
    }

    func checkIfLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            store.locationManager = CLLocationManager()
            store.locationManager?.delegate = self
        } else {
            Common.showSMErrorAlert("Please enable location services")
        }
    }

    private func checkLocationAuthorizationStatus() {
        guard let locationManager = store.locationManager else { return }

        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            Common.showSMErrorAlert("Your location access is restricted")
        case .denied:
            Common.showSMErrorAlert("You have denied location access")
        case .authorizedAlways, .authorizedWhenInUse:
            store.initLocation = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        @unknown default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorizationStatus()
    }
}

extension MapsInteractor {
    func handle(deeplink: Deeplink) {
        switch deeplink.action {
        default: break
        }
    }
}
