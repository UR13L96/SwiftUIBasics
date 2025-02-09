//
//  OnboardingThree.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 06/02/25.
//

import SwiftUI

struct OnboardingThree: View {
    var body: some View {
        VStack {
            Text("Step 2")
                .font(.largeTitle)
                .bold()
            
            Image(systemName: "tortoise.fill")
                .font(.system(size: 100))
                .foregroundStyle(Color.red)
            
            Text("You're almost done!")
                .font(.system(size: 16))
        }
    }
}

#Preview {
    OnboardingThree()
}
