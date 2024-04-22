//
//  MapView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 19/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    let hollywood = CLLocationCoordinate2D(
        latitude: 34.0944781,
        longitude: -118.3559678
    )
    
    var body: some View {
        Map(initialPosition: .region(MKCoordinateRegion(center: hollywood, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))) {
            Marker("Holywood", coordinate: hollywood)
                .tint(.purple)
        }
    }
}

#Preview {
    MapView()
}
