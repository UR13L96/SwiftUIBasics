//
//  SwiftUIBasicsApp.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 22/02/24.
//

import SwiftUI
import RealmSwift

@main
struct SwiftUIBasicsApp: SwiftUI.App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared
    
    init() {
        setupRealm()
    }
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
    private func setupRealm() {
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {  }
            }
        )
        Realm.Configuration.defaultConfiguration = config
    }
}
