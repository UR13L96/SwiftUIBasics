//
//  CounterView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 07/03/24.
//

import SwiftUI

struct CounterView: View {
    @Binding var counter: Int
    
    var body: some View {
        VStack {
            Button(action: {
                counter += 1
            }) {
                Label("\(counter)", systemImage: "play.fill")
            }
            .padding(.all)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
    }
}

#Preview {
    CounterView(counter: .constant(0))
}
