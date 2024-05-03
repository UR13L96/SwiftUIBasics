//
//  MenuView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 19/03/24.
//

import SwiftUI

struct MenuView: View {
    @State private var mode: ColorScheme = .dark
    @State private var darkModeEnabled: Bool = true
    
    let topics: [Topic] = [
        Topic(name: "SwiftUI Basics"),
        Topic(name: "Dark Mode & User Defaults"),
        Topic(name: "Core Data"),
        Topic(name: "Core Data & Images"),
        Topic(name: "Maps"),
        Topic(name: "Realm")
    ]
    
    private func readDarkMode() {
        darkModeEnabled = (UserDefaults.standard.object(forKey: "darkModeEnabled") as? Bool) ?? true
        mode = darkModeEnabled ? .dark : .light
    }
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach(Array(topics.enumerated()), id: \.offset) { i, topic in
                    NavigationLink(destination: moduleView(i: i)) {
                        Text(topic.name)
                    }
                }
            }
            .navigationTitle("iOS 13 App Development")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                readDarkMode()
            })
        }.environment(\.colorScheme, mode)
    }
    
    @ViewBuilder
    func moduleView(i: Int) -> some View {
        switch i {
        case 0:
            ContentView().environmentObject(RandomNumber())
        case 1:
            DarkModeView(mode: $mode)
        case 2:
            ContactsView()
        case 3:
            PlacesView()
        case 4:
            MapMenuView()
        case 5:
            PersonsView()
        default:
            ContentView().environmentObject(RandomNumber())
        }
    }
}

#Preview {
    MenuView()
}
