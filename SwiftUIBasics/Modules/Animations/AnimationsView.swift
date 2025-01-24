//
//  AnimationsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 14/01/25.
//

import SwiftUI

struct AnimationsView: View {
    var body: some View {
        TabView {
            BasicAnimationsView().tabItem {
                Text("Basic animations")
            }
            
            TransformationsView().tabItem {
                Text("Transformations")
            }
            
            TransitionsView().tabItem {
                Text("Transitions")
            }
        }
    }
}

#Preview {
    AnimationsView()
}
