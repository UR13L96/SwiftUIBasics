//
//  PlacesHomeView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 08/04/24.
//

import SwiftUI

struct PlacesHomeView: View {
    @FetchRequest(entity: Place.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Place.name, ascending: true)
    ]) var places: FetchedResults<Place>
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(places) { place in
                        VStack {
                            Spacer()
                            
                            Image(uiImage: UIImage(data: place.image) ?? UIImage())
                                .resizable()
                                .frame(width: 250, height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(radius: 16)
                                .padding(10)
                            
                            Text(place.name)
                                .font(.title)
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PlacesHomeView()
}
