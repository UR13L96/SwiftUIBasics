//
//  ScannerView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 05/03/25.
//

import SwiftUI
import VisionKit

struct ScannerView: UIViewControllerRepresentable {
    let completion: ([String]?) -> Void
    
    init(completion: @escaping ([String]?) -> Void) {
        self.completion = completion
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(completion: completion)
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        let completion: ([String]?) -> Void
        
        init(completion: @escaping ([String]?) -> Void) {
            self.completion = completion
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let recognizer = TextRecognizer(cameraScan: scan)
            recognizer.recognizeText(completion: completion)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            completion(nil)
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: any Error) {
            print(error.localizedDescription)
            completion(nil)
        }
    }
}
