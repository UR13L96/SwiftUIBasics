//
//  Loader.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 18/07/24.
//

import Foundation
import Combine
import FirebaseStorage

class Loader: ObservableObject {
    var didChange = PassthroughSubject<Data?, Never>()
    @Published var data: Data? = nil {
        didSet {
            didChange.send(data)
        }
    }
    
    init(imageURL: String) {
        let storageImage = Storage.storage().reference(forURL: imageURL)
        storageImage.getData(maxSize: 1024 * 1024) { data, error in
            if let error = error {
                print("FirebaseStorage:", error.localizedDescription)
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.data = data
            }
        }
    }
}
