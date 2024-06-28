//
//  FirebaseHomeView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 24/06/24.
//

import SwiftUI
import FirebaseAuth

struct FirebaseHomeView: View {
    @Binding var logged: Bool
    
    var body: some View {
        ZStack {
            List {
                ForEach(1..<10) { item in
                    Text("Post \(item)")
                }
            }
        }
        .navigationTitle(Text("Home"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            Button {
                try? Auth.auth().signOut()
                logged = false
                UserDefaults.standard.removeObject(forKey: "FirebaseLogged")
            } label: {
                Text("Salir")
            }

        })
        
    }
}

#Preview {
    FirebaseHomeView(logged: .constant(false))
}
