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
        List(networkManager.baseResponse.data, id: \.id) { user in
            HStack {
                AsyncImage(url: URL(string: user.avatar))
                    .scaledToFit()
                    .frame(width: 96, height: 96)
                    .clipped()
                VStack(alignment: .leading) {
                    Text(user.firstName)
                        .font(.title)
                        .bold()
                    
                    Text(user.email)
                        .font(.subheadline)
                }
            }
        }
        
        NavigationLink(destination: LoginView()) {
            Text("Go to Login")
        }
    }
}

#Preview {
    UsersView()
}
