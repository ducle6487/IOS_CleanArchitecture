//
//  MapsView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import MapKit
import SwiftUI

public struct MapsView: View {
    @InjectObservable(\.mapsStore) var store

    public var body: some View {
        NavigationView {
            Map(coordinateRegion: $store.initLocation, showsUserLocation: true, annotationItems: store.locations) { location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                    ZStack {
                        RoundedCorner()
                            .fill(Color.red.opacity(0.5))
                            .frame(width: 100, height: 100)

                        CombustionImage(image: Image(systemName: "mappin"), resizable: false)
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .navigationTitle("Maps")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
            .previewTheme(for: .light)
    }
}
