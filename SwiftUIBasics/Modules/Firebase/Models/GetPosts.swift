//
//  GetPosts.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 05/07/24.
//

import Foundation
import FirebaseFirestore
import SwiftUI
import Combine

class GetPosts: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("posts").addSnapshotListener { [weak self] query, error in
            if let error = error {
                print("Firestore:", error.localizedDescription)
            } else {
                self?.posts.removeAll()
                
                for document in query?.documents ?? [] {
                    let data = document.data()
                    let post = Post(
                        id: document.documentID,
                        title: data["title"] as? String ?? "Title not found",
                        description: data["description"] as? String ?? "Description not found",
                        email: data["email"] as? String ?? "Email not found", 
                        image: data["image"] as? String ?? "Image not found"
                    )
                    
                    DispatchQueue.main.async {
                        self?.posts.append(post)
                    }
                }
            }
        }
    }
}
