//
//  SwiftUIBasicsApp.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 22/02/24.
//

import SwiftUI

@main
struct SwiftUIBasicsApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
