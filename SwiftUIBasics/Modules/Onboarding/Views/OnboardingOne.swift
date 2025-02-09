//
//  OnboardingOne.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 06/02/25.
//

import SwiftUI

struct OnboardingOne: View {
    var body: some View {
        VStack {
            Text("Welcome")
                .font(.largeTitle)
                .bold()
            
            Image(systemName: "heart.fill")
                .font(.system(size: 100))
                .foregroundStyle(Color.red)
            
            Text("You are in the best finance app")
                .font(.system(size: 16))
        }
    }
}

#Preview {
    OnboardingOne()
}
