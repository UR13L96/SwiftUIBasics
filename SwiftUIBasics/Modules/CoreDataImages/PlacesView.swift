//
//  PlacesView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 08/04/24.
//

import SwiftUI

struct PlacesView: View {
    @State private var position = 0
    
    var body: some View {
        VStack {
            Picker(selection: $position) {
                Image(systemName: "house.fill").tag(0)
                Image(systemName: "flame.fill").tag(1)
                Image(systemName: "pencil").tag(2)
            } label: {
                Text("")
            }.pickerStyle(SegmentedPickerStyle())

            if position == 0 {
                PlacesHomeView()
            } else if position == 1 {
                PlaceFormView()
            } else {
                PlacesNavigationBarView()
            }
            Spacer()
        }
    }
}

#Preview {
    PlacesView()
}
