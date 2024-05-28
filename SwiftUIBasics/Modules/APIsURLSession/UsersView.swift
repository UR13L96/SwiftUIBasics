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
                Text(user.avatar)
                VStack(alignment: .leading) {
                    Text(user.firstName)
                        .font(.title)
                        .bold()
                    
                    Text(user.email)
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    UsersView()
}
