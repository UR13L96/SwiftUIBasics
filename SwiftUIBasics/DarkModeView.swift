//
//  DarkModeView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 20/03/24.
//

import SwiftUI

struct DarkModeView: View {
    @Binding var mode: ColorScheme
    
    var body: some View {
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
                UserDefaults.standard.setValue(mode == .dark, forKey: "darkModeEnabled")
            }
        }
    }
}

#Preview {
    DarkModeView(mode: .constant(.dark))
}
