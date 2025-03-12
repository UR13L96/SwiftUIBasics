//
//  VisionImagesView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 11/03/25.
//

import SwiftUI

struct VisionImagesView: View {
    let models = [
        VisionModel(name: "car")
    ]
    
    var body: some View {
        List(models) { item in
            NavigationLink(destination: VisionImageDetailView(visionModel: item)) {
                HStack {
                    Image(item.name)
                        .resizable()
                        .frame(width: 100, height: 60)
                    
                    Text(item.name)
                }
            }
        }.navigationTitle(Text("Vision Images"))
    }
}

#Preview {
    VisionImagesView()
}
