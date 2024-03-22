//
//  MenuView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 19/03/24.
//

import SwiftUI

struct MenuView: View {
    @State private var mode: ColorScheme = .dark
    
    let topics: [Topic] = [
        Topic(name: "SwiftUI Basics"),
        Topic(name: "Dark Mode & User Defaults")
    ]
    
    var body: some View {
        NavigationStack {
            List(topics) { topic in
//                NavigationLink(destination: ContentView().environmentObject(RandomNumber())) {
//                    Text(topic.name)
//                }
                NavigationLink(destination: DarkModeView(mode: $mode)) {
                    Text(topic.name)
                }
            }
            .navigationTitle("iOS 13 App Development")
            .navigationBarTitleDisplayMode(.inline)
        }.environment(\.colorScheme, mode)
    }
}

#Preview {
    MenuView()
}
