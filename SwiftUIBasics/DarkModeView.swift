//
//  DarkModeView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 20/03/24.
//

import SwiftUI

struct DarkModeView: View {
    var body: some View {
        HStack {
            Image(systemName: "moon.circle")
                .font(.title)
            Text("Dark mode")
                .font(.title)
                .bold()
                .navigationTitle("User Defaults")
                .navigationBarTitleDisplayMode(.inline)
                .foregroundStyle(Color("text.color", bundle: nil))
        }
    }
}

#Preview {
    DarkModeView()
}
