//
//  BasicAnimationsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 14/01/25.
//

import SwiftUI

struct BasicAnimationsView: View {
    @State private var show = false
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    show.toggle()
                }
            } label: {
                Text("Show")
            }
            
            Image(systemName: "chevron.up.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(Color.green)
                .rotationEffect(.degrees(show ? 0 : 180))
        }
    }
}

#Preview {
    BasicAnimationsView()
}
