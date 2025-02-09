//
//  OnboardingTwo.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 06/02/25.
//

import SwiftUI

struct OnboardingTwo: View {
    var body: some View {
        VStack {
            Text("Step 1")
                .font(.largeTitle)
                .bold()
            
            Image(systemName: "bolt.circle.fill")
                .font(.system(size: 100))
                .foregroundStyle(Color.red)
            
            Text("Step 1 description")
                .font(.system(size: 16))
        }
    }
}

#Preview {
    OnboardingTwo()
}
