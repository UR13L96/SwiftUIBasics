//
//  VisionImageDetailView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 11/03/25.
//

import SwiftUI

struct VisionImageDetailView: View {
    let visionModel: VisionModel
    @State private var result: String = ""
    
    var body: some View {
        VStack {
            Image(visionModel.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button {
                
            } label: {
                Text("Scan")
            }
            
            Text(result)
            Spacer()
        }.navigationTitle(visionModel.name)
    }
}

#Preview {
    VisionImageDetailView(visionModel: VisionModel(name: "car"))
}
