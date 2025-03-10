//
//  TextRecognizer.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 05/03/25.
//

import Foundation
import Vision
import VisionKit

class TextRecognizer {
    let cameraScan: VNDocumentCameraScan
    
    init(cameraScan: VNDocumentCameraScan) {
        self.cameraScan = cameraScan
    }
    
    func recognizeText(completion: @escaping ([String]) -> Void) {
        DispatchQueue.main.async {
            let images = (0..<self.cameraScan.pageCount).compactMap { self.cameraScan.imageOfPage(at: $0).cgImage }
            let imagesRequest = images.map { (image: $0, request: VNRecognizeTextRequest()) }
            let scannedText = imagesRequest.map { image, request -> String in
                let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
                do {
                    try requestHandler.perform([request])
                    guard let observations = request.results else {
                        return ""
                    }
                    
                    return observations.compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
                } catch {
                    print(error.localizedDescription)
                    return ""
                }
            }
            
            completion(scannedText)
        }
    }
}
