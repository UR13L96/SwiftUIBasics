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
    
    @ObservedObject var randomNumber = RandomNumber()
    
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
        songs.append(Song(
            name: "Se Que Te Amo",
            artist: "Los Temerarios",
            albumImage: "una.lagrima.no.basta",
            isFavorite: true
        ))
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("Welcome to the course \(name)")
                .font(.subheadline)
                .foregroundColor(.green)
                .bold()
            
            Text("\(randomNumber.number)")
                .font(.title)
                .bold()
            
            HStack {
                Button(action: {
                    randomNumber.startTimer()
                }) {
                    Label("START", systemImage: "play.fill")
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(8)
                
                Button(action: {
                    randomNumber.stopTimer()
                }) {
                    Label("STOP", systemImage: "stop.fill")
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
            }
            
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
                CounterView(counter: $randomNumber.counter)
            }
        }.padding(.all)
    }
}

#Preview {
    ContentView()
}

