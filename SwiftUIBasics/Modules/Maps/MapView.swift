//
//  MapView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 19/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var latitude = 34.0944781
    @State private var longitude = -118.3559678
    @State private var country = "Holywood"
    
    var body: some View {
        VStack {
            Map(initialPosition: .region(MKCoordinateRegion(center: CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            ), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))) {
                Marker(country, coordinate: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                ))
                    .tint(.purple)
            }
            .mapStyle(.standard(elevation: .realistic))
        }.onAppear {
            if let latitude = UserDefaults.standard.value(forKey: "latitude") as? Double,
               let longitude = UserDefaults.standard.value(forKey: "longitude") as? Double,
               let country = UserDefaults.standard.value(forKey: "country") as? String {
                self.latitude = latitude
                self.longitude = longitude
                self.country = country
            }
        }
    }
}

#Preview {
    MapView()
}
