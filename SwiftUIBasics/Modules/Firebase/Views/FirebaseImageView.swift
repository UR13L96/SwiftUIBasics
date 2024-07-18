//
//  ImageFromFirebase.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 18/07/24.
//

import Foundation
import UIKit
import SwiftUI

let altImage = UIImage(systemName: "photo")

struct FirebaseImageView: View {
    @ObservedObject var imageLoader: Loader
    
    init(imageURL: String) {
        self.imageLoader = Loader(imageURL: imageURL)
    }
    
    var image: UIImage? {
        self.imageLoader.data.flatMap(UIImage.init)
    }
    
    var body: some View {
        Image(uiImage: image ?? (altImage ?? UIImage()))
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 5)
            .aspectRatio(contentMode: .fill)
    }
}
