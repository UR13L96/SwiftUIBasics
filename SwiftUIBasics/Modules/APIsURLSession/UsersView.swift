//
//  UsersView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 28/05/24.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    UsersView()
}
