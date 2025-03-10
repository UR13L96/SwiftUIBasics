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
    @State private var isNotificationShow: Bool = false
    
    let topics: [Topic] = [
        Topic(name: "SwiftUI Basics"),
        Topic(name: "Dark Mode & User Defaults"),
        Topic(name: "Core Data"),
        Topic(name: "Core Data & Images"),
        Topic(name: "Maps"),
        Topic(name: "Realm"),
        Topic(name: "APIs URLSession"),
        Topic(name: "Firebase"),
        Topic(name: "LocalNotifications"),
        Topic(name: "Animations"),
        Topic(name: "Onboarding"),
        Topic(name: "Charts"),
        Topic(name: "Circular Progress Bar"),
        Topic(name: "Audio Player"),
        Topic(name: "Translation"),
        Topic(name: "Vision Text")
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
            .navigationDestination(isPresented: $isNotificationShow, destination: {
                HelloNotificationsView()
            })
            .onAppear(perform: {
                readDarkMode()
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("notification.action.one"), object: nil, queue: .main) { _ in
                    isNotificationShow.toggle()
                }
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
        case 6:
            UsersView()
        case 7:
            FirebaseContentView()
        case 8:
            LocalNotificationsView()
        case 9:
            AnimationsView()
        case 10:
            OnboardingView()
        case 11:
            ChartsView()
        case 12:
            CircularProgressBarView()
        case 13:
            AudioPlayerView()
        case 14:
            TranslationView()
        case 15:
            VisionTextView()
        default:
            ContentView().environmentObject(RandomNumber())
        }
    }
}

#Preview {
    MenuView()
}
