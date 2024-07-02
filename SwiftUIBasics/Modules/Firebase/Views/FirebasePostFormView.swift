//
//  FirebasePostFormView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 01/07/24.
//

import SwiftUI

struct FirebasePostFormView: View {
    @Binding var isVisible: Bool
    @State private var title: String = ""
    @State private var text: String = ""
    @State private var description: String = ""
    
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
