//
//  CircularBarView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 19/02/25.
//

import SwiftUI

struct CircularBarView: View {
    var percentage: CGFloat = 0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .overlay {
                    Circle()
                        .trim(from: 0, to: percentage * 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                        .fill(Color.white)
                }.animation(.interactiveSpring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0), value: percentage)
            
            Text(String(format: "%.2f", percentage) + "%")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    CircularBarView()
}
