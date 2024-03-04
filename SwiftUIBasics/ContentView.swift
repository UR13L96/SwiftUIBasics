//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 22/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlertVisible: Bool = false
    @State private var isConfirmationDialogVisible: Bool = false
    @State private var name: String = "Isaac"
    
    @State private var songs: [Song] = []
    @State private var isFavoriteEnabled = false
    
    private func addSongs() {
        songs.append(Song(
            name: "Snow (Hey Oh)",
            artist: "Red Hot Chili Peppers",
            albumImage: "stadium.arcadium",
            isFavorite: true
        ))
        songs.append(Song(
            name: "La Tequilera",
            artist: "Ángela Aguilar",
            albumImage: "primero.soy.mexicana",
            isFavorite: false
        ))
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("SwiftUI Course")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .underline()
            Text("Welcome to the course \(name)")
                .font(.subheadline)
                .foregroundColor(.green)
                .bold()
            Spacer()
            List {
                Toggle(isOn: $isFavoriteEnabled) {
                    Text("Favoritos")
                }
                ForEach(songs.filter { $0.isFavorite == isFavoriteEnabled }) { song in
                    HStack {
                        Image(song.albumImage)
                            .resizable()
                            .frame(width: 64, height: 64)
                        VStack(alignment: .leading) {
                            Text(song.name)
                                .font(.title3)
                                .bold()
                            Text(song.artist)
                                .font(.subheadline)
                        }
                    }
                }
            }
            Spacer()
            HStack(alignment: .center, spacing: 8) {
                Button(action: {
                    isAlertVisible.toggle()
                }) {
                    Label("ALERT", systemImage: "exclamationmark.triangle.fill")
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .alert("ALERT", isPresented: $isAlertVisible) {
                    TextField("Name", text: $name)
                    Button("Confirm") { }
                } message: {
                    Text("I prefer to give you a personalized greeting")
                }
                
                Button(action: {
                    addSongs()
                }) {
                    Label("ADD SONGS", systemImage: "music.note")
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
//                .confirmationDialog("MENU", isPresented: $isConfirmationDialogVisible) {
//                    Button("Galery", action: {
//                        print("Galery selected")
//                    })
//                    Button("Camera", action: {
//                        print("Camera selected")
//                    })
//                    Button(role: .cancel, action: {}) {
//                        Text("Cancel")
//                    }
//                } message: {
//                    Text("Select an option")
//                }

            }
        }.padding(.all)
    }
}

#Preview {
    ContentView()
}

