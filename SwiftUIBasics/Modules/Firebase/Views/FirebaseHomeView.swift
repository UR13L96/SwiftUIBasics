//
//  FirebaseHomeView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 24/06/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct FirebaseHomeView: View {
    @Binding var logged: Bool
    @State private var isPostFormVisible = false
    @ObservedObject var posts = GetPosts()
    @State private var updatingPost: Post?
    
    var body: some View {
        ZStack {
            List {
                ForEach(posts.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.title)
                            .bold()
                        
                        Text(post.description)
                    }.onTapGesture {
                        updatingPost = post
                        isPostFormVisible.toggle()
                    }
                }.onDelete(perform: { indexSet in
                    if let index = indexSet.first {
                        let id = self.posts.posts[index].id
                        let db = Firestore.firestore()
                        
                        db.collection("posts").document(id).delete()
                        posts.posts.remove(atOffsets: indexSet)
                    }
                })
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isPostFormVisible.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .frame(width: 56, height: 56)
                            .foregroundStyle(Color.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .padding()
                    }
                }
            }
            .sheet(isPresented: $isPostFormVisible, content: {
                FirebasePostFormView(isVisible: $isPostFormVisible, post: $updatingPost)
            })
        }
        .navigationTitle(Text("Home"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            Button {
                try? Auth.auth().signOut()
                logged = false
                UserDefaults.standard.removeObject(forKey: "FirebaseLogged")
            } label: {
                Text("Salir")
            }

        })
        
    }
}

#Preview {
    FirebaseHomeView(logged: .constant(false))
}
