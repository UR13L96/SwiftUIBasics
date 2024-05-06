//
//  PersonsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 03/05/24.
//

import SwiftUI

struct PersonsView: View {
    var body: some View {
        List() {
            VStack(alignment: .leading) {
                Text("Title")
                Text("Subtitle")
                    .font(.caption)
            }
        }.toolbar(content: {
            NavigationLink(destination: PersonFormView()) {
                Image(systemName: "plus")
            }
        })
    }
}

#Preview {
    PersonsView()
}
