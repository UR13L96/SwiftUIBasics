//
//  PlaceFormView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 08/04/24.
//

import SwiftUI
import PhotosUI

struct PlaceFormView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var photosPicker: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var isSourceMenuVisible = false
    @State private var isPhotosPickerVisible = false
    @State private var imageData: Data?
    
    var body: some View {
        VStack {
            selectedImage?
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(.rect(cornerRadius: 16))
            
            Button {
                isSourceMenuVisible = true
            } label: {
                Text("Load image")
            }
            .confirmationDialog("Menu", isPresented: $isSourceMenuVisible) {
                Button("Gallery", action: {
                    isPhotosPickerVisible = true
                })
                Button("Camera", action: {
                    print("Camera selected")
                })
                Button(role: .cancel, action: {}) {
                    Text("Cancel")
                }
            } message: {
                Text("Select an option")
            }
            .photosPicker(isPresented: $isPhotosPickerVisible, selection: $photosPicker)

            Button {
                let place = Place(context: viewContext)
                place.name = "Toluca"
                if let data = imageData {
                    place.image = data
                }
                
                do {
                    try viewContext.save()
                } catch let error {
                    print(error.localizedDescription)
                }
            } label: {
                Text("Save image")
            }

        }
        .onChange(of: photosPicker) {
            Task {
                if let loaded = try? await photosPicker?.loadTransferable(type: Image.self) {
                    selectedImage = loaded
                }
                
                if let loaded = try? await photosPicker?.loadTransferable(type: Data.self) {
                    imageData = loaded
                }
            }
        }
    }
}

#Preview {
    PlaceFormView()
}
