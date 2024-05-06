//
//  SecondCounterView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 08/03/24.
//

import SwiftUI

struct SecondCounterView: View {
    @EnvironmentObject var randomNumber: RandomNumber
    
    var body: some View {
        VStack {
            Button(action: {
                randomNumber.counter += 1
            }) {
                Label("\(randomNumber.counter)", systemImage: "plus")
            }
            .padding(.all)
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(8)
            
            Button("RESTART") {
                randomNumber.restartCounter()
            }
        }
    }
}

#Preview {
    SecondCounterView()
}
