//
//  BarView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 11/02/25.
//

import SwiftUI

struct BarView: View {
    var value: Double = 15
    var title: String = ""
    @State private var bar = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 50, height: 200)
                    .foregroundStyle(Color.gray)
                
                Capsule()
                    .frame(width: 50, height: CGFloat(bar))
                    .animation(.default, value: bar)
                    .foregroundStyle(Color.white)
            }
            
            Text(title)
        }.onAppear {
            bar = Int(value) + bar
        }
    }
}

#Preview {
    BarView()
}
