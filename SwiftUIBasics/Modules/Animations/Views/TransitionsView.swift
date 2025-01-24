//
//  ScaleView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 14/01/25.
//

import SwiftUI

struct TransitionsView: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Button {
                withAnimation {
                    show.toggle()
                }
            } label: {
                Text("See more")
            }
            
            if show {
                TransitionsInfoView(show: $show).transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    TransitionsView()
}
