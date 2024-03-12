//
//  CounterView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 07/03/24.
//

import SwiftUI

struct CounterView: View {
    @EnvironmentObject var randomNumber: RandomNumber
    
    var body: some View {
        VStack {
            Button(action: {
                randomNumber.counter += 1
            }) {
                Label("\(randomNumber.counter)", systemImage: "play.fill")
            }
            .padding(.all)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
            .navigationTitle(Text("Counter view"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                HStack {
                    NavigationLink(destination: SecondCounterView()) {
                        Image(systemName: "plus.app.fill")
                            .foregroundStyle(Color.red)
                    }
                    
                    NavigationLink(destination: SecondCounterView()) {
                        Image(systemName: "plus.app")
                            .foregroundStyle(Color.red)
                    }
                }
            }
        }
    }
}

#Preview {
    CounterView()
}
