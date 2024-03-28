//
//  ContactsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 28/03/24.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        VStack {
            List {
                Text("Content")
            }
            
            NavigationLink(destination: ContactFormView()) {
                Image(systemName: "plus.app.fill")
                    .foregroundStyle(Color.white)
                    .font(.title)
                Text("Save")
                    .foregroundStyle(Color.white)
                    .font(.title)
            }
                .padding(10)
                .background(Color.green)
                .navigationTitle("Contacts")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContactsView()
}
