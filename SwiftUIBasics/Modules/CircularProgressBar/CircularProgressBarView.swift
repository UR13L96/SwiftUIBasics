//
//  CircularProgressBarView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 19/02/25.
//

import SwiftUI

struct CircularProgressBarView: View {
    @State private var percentage: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 24) {
                Text("Circular chart")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                    .bold()
                
                CircularBarView(percentage: percentage)
                
                Button {
                    self.percentage = CGFloat.random(in: 0...100)
                } label: {
                    Text("Refresh")
                }
                .foregroundStyle(Color.white)

            }
        }.onAppear() {
            self.percentage = CGFloat.random(in: 0...100)
        }
    }
}

#Preview {
    CircularProgressBarView()
}
