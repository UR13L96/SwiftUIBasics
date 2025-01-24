//
//  TransitionsInfoView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 24/01/25.
//

import SwiftUI

struct TransitionsInfoView: View {
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            Color.yellow
            VStack {
                Text("More information")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.white)
                
                Button {
                    withAnimation {
                        show.toggle()
                    }
                } label: {
                    Text("Close")
                }

            }
        }
    }
}

#Preview {
    TransitionsInfoView(show: .constant(false))
}
