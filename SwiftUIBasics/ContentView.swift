//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 22/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("SwiftUI Course")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .underline()
            Text("Welcome to the course")
                .font(.subheadline)
                .foregroundColor(.green)
                .bold()
            Spacer()
            HStack(alignment: .center, spacing: 8) {
                Button(action: {}) {
                    Label("ALERT", systemImage: "exclamationmark.triangle.fill")
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                
                Button(action: {}) {
                    Label("SELECT", systemImage: "folder.fill")
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
            }
        }.padding(.all)
    }
}

#Preview {
    ContentView()
}

