//
//  CounterView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 07/03/24.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var number = RandomNumber()
    
    var body: some View {
        VStack {
            Button(action: {
                number.counter += 1
            }) {
                Label("\(number.counter)", systemImage: "play.fill")
            }
            .padding(.all)
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(8)
        }
    }
}

#Preview {
    CounterView()
}
