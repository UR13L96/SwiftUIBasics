//
//  TransformationsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 14/01/25.
//

import SwiftUI

struct TransformationsView: View {
    @State private var color = Color.blue
    @State private var radius: CGFloat = 0
    
    var body: some View {
        VStack {
            Button {
                radius = radius == 0 ? 100 : 0
                color = color == .blue ? .red : .blue
            } label: {
                Text("Animate")
                    .foregroundStyle(Color.white)
                    .frame(width: 200, height: 200)
                    .background(color)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                    .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: color)
            }

        }
    }
}

#Preview {
    TransformationsView()
}
