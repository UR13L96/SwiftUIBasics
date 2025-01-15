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
        VStack {
            HStack {
                Button {
                    withAnimation(.interpolatingSpring(mass: 3.0, stiffness: 100.0, damping: 10.0, initialVelocity: 0.0)) {
                        show.toggle()
                    }
                } label: {
                    Text("Show")
                        .font(.largeTitle)
                }
                
                Image(systemName: "chevron.up.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color.green)
                    .rotationEffect(.degrees(show ? 0 : 180))
            }
            
            if show {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet nunc diam. Curabitur fermentum vestibulum viverra. Praesent tincidunt augue a ipsum eleifend ultricies. Nam nec fringilla erat, nec auctor ligula. Fusce et eleifend libero. Morbi dapibus felis eu ante dictum, suscipit tincidunt quam elementum. Cras elit nunc, auctor vel sollicitudin at, volutpat eget eros. Suspendisse vulputate, ante ac ornare iaculis, ante nibh efficitur libero, at dignissim erat eros vitae risus. Integer vulputate eget enim ut ultricies. Pellentesque lorem nisl, porta quis sem in, ornare pretium felis. Aliquam erat volutpat.")
                    .transition(.move(edge: .top))
            }
            
            Spacer()
        }.padding(.all)
    }
}

#Preview {
    BasicAnimationsView()
}
