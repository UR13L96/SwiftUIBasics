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
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 50, height: 200)
                    .foregroundStyle(Color.gray)
                
                Capsule()
                    .frame(width: 50, height: CGFloat(value))
                    .foregroundStyle(Color.white)
            }
            
            Text(title)
        }
    }
}

#Preview {
    BarView()
}
