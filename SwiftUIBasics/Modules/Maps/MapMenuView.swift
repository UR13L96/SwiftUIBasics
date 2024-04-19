//
//  MapMenuView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 19/04/24.
//

import SwiftUI

struct MapMenuView: View {
    var body: some View {
        TabView {
            MapView().tabItem {
                Image(systemName: "map.fill")
            }
            
            LocationView().tabItem {
                Image(systemName: "mappin.circle.fill")
            }
            
            UIKitMapView().tabItem {
                Image(systemName: "location.fill")
            }
        }
    }
}

#Preview {
    MapMenuView()
}
