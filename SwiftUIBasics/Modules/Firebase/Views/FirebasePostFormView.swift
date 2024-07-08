//
//  FirebasePostFormView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 01/07/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct FirebasePostFormView: View {
    @Binding var isVisible: Bool
    @State private var title: String = ""
    @State private var description: String = ""
    
    @Binding var post: Post?
    
    private func savePost() {
        if post == nil {
            createNewPost()
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
            }
        }
    }
    
    private func createNewPost() {
        let db = Firestore.firestore()
        guard let email = Auth.auth().currentUser?.email else { return }
        let post: [String: Any] = [
            "title": title,
            "description": description,
            "email": email
        ]
        
        db.collection("posts").addDocument(data: post) { error in
            if let error = error {
                print("Firestore", error.localizedDescription)
            }
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
                    savePost()
                    post = nil
                    isVisible.toggle()
                } label: {
                    Text(post == nil ? "Post" : "Update")
                }
            }
            
            TextField("Title", text: $title)
            
            TextEditor(text: $description)
                .border(.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .frame(height: 160)
        }
        .padding(.all)
        .onAppear {
            if let post = post {
                title = post.title
                description = post.description
            }
        }
    }
}

#Preview {
    FirebasePostFormView(isVisible: .constant(false), post: .constant(nil))
}
