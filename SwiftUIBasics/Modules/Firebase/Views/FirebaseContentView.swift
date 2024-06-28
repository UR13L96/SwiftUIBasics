//
//  FirebaseContenView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 28/06/24.
//

import SwiftUI

struct FirebaseContentView: View {
    @State private var logged = false
    
    var body: some View {
        Group {
            if logged {
                FirebaseHomeView(logged: $logged)
            } else {
                FirebaseLoginView(logged: $logged)
            }
        }.onAppear {
            if UserDefaults.standard.object(forKey: "FirebaseLogged") != nil {
                logged = true
            }
        }
    }
}

#Preview {
    FirebaseContentView()
}
