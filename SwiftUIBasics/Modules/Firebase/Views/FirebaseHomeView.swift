//
//  FirebaseHomeView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 24/06/24.
//

import SwiftUI

struct FirebaseHomeView: View {
    @State private var loggedIn = false
    
    var body: some View {
        Group {
            if loggedIn {
                FirebaseRegisterView()
            } else {
                FirebaseLoginView(logged: $loggedIn)
            }
        }
    }
}

#Preview {
    FirebaseHomeView()
}
