//
//  FirebaseHomeView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 24/06/24.
//

import SwiftUI

struct FirebaseHomeView: View {
    @State private var logged = false
    
    var body: some View {
        Group {
            if logged {
                FirebaseRegisterView()
            } else {
                FirebaseLoginView(logged: $logged)
            }
        }
    }
}

#Preview {
    FirebaseHomeView()
}
