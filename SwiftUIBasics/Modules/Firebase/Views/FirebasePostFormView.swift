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
    
    private func savePost() {
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
                    isVisible.toggle()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()

                Button {
                    savePost()
                    isVisible.toggle()
                } label: {
                    Text("Post")
                }
            }
            
            TextField("Title", text: $title)
            
            TextEditor(text: $description)
                .border(.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .frame(height: 160)
        }.padding(.all)
    }
}

#Preview {
    FirebasePostFormView(isVisible: .constant(false))
}
