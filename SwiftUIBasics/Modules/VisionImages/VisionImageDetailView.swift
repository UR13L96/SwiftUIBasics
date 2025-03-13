//
//  VisionImageDetailView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 11/03/25.
//

import SwiftUI
import Vision
import UIKit

struct VisionImageDetailView: View {
    let visionModel: VisionModel
    @State private var result: String = ""
    
    var body: some View {
        VStack {
            Image(visionModel.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button {
                classifyImage()
            } label: {
                Text("Scan")
            }
            
            Text(result)
                .font(.largeTitle)
            
            Spacer()
        }.navigationTitle(visionModel.name)
    }
    
    func classifyImage() {
        DispatchQueue.main.async {
            var requests = [VNRequest]()
            let image = UIImage(named: visionModel.name)
            
            do {
                let modelML = try VNCoreMLModel(for: MLModel(contentsOf: ImageClassifier.urlOfModelInThisBundle))
                let classification = VNCoreMLRequest(model: modelML) { request, error in
                    if let result = request.results as? [VNClassificationObservation] {
                        self.result = result.first?.identifier ?? "No result"
                    }
                }
                
                requests = ([classification])
                let requestHandler = VNImageRequestHandler(data: image!.pngData()!, options: [:])
                do {
                    try requestHandler.perform(requests)
                } catch {
                    print(error.localizedDescription)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    VisionImageDetailView(visionModel: VisionModel(name: "car"))
}
