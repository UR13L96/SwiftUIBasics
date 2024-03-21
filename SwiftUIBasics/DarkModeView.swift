//
//  DarkModeView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 20/03/24.
//

import SwiftUI

struct DarkModeView: View {
    @State private var mode: ColorScheme = .dark
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320)
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
                Button("Change mode") {
                    mode = mode == .light ? .dark : .light
                }
            }
        }.environment(\.colorScheme, mode)
    }
}

#Preview {
    DarkModeView()
}
