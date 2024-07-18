//
//  FirebasePostFormView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 01/07/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import PhotosUI

struct FirebasePostFormView: View {
    @Binding var isVisible: Bool
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var photosPicker: PhotosPickerItem?
    @State private var isSourceMenuVisible = false
    @State private var isPhotosPickerVisible = false
    @State private var selectedImage: Image?
    @State private var imageData: Data?

    @Binding var post: Post?
    
    private func savePost(imageDirectory: String) {
        if post == nil {
            createNewPost(imageDirectory: imageDirectory)
        } else {
            updatePost()
        }
    }
    
    private func updatePost() {
        guard let postId = post?.id else { return }
        let db = Firestore.firestore()
        let fields: [String: Any] = [
            "title": title,
            "description": description
        ]
        
        db.collection("posts").document(postId).updateData(fields) { error in
            if let error = error {
                print("Firestore:", error.localizedDescription)
                return
            }
        }
    }
    
    private func createNewPost(imageDirectory: String) {
        let db = Firestore.firestore()
        guard let email = Auth.auth().currentUser?.email else { return }
        let post: [String: Any] = [
            "title": title,
            "description": description,
            "email": email,
            "image": imageDirectory
        ]
        
        db.collection("posts").addDocument(data: post) { error in
            if let error = error {
                print("Firestore", error.localizedDescription)
                return
            }
            
            isVisible.toggle()
        }
    }
    
    private func saveImage() {
        guard let data = imageData else { return }
        let storage = Storage.storage().reference()
        let imageName = UUID().uuidString
        let directory = storage.child("posts/\(imageName)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        directory.putData(data, metadata: metadata) { (data, error) in
            if let error = error {
                print("Storage", error.localizedDescription)
                return
            }
            
            savePost(imageDirectory: String(describing: directory))
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    post = nil
                    isVisible.toggle()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()

                Button {
                    saveImage()
                    post = nil
                } label: {
                    Text(post == nil ? "Post" : "Update")
                }
            }
            
            TextField("Title", text: $title)
            
            TextEditor(text: $description)
                .border(.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .frame(height: 160)
            
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
        }
        .padding(.all)
        .onAppear {
            if let post = post {
                title = post.title
                description = post.description
            }
        }
        .onChange(of: photosPicker) {
            Task {
                if let loaded = try? await photosPicker?.loadTransferable(type: Image.self) {
                    selectedImage = loaded
                }
                
                if let loaded = try? await photosPicker?.loadTransferable(type: Data.self) {
                    let image = UIImage(data: loaded)
                    imageData = image?.jpegData(compressionQuality: 0.1)
                }
            }
        }
    }
}

#Preview {
    FirebasePostFormView(isVisible: .constant(false), post: .constant(nil))
}
