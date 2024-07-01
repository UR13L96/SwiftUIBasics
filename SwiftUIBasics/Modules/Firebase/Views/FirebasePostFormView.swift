//
//  FirebasePostFormView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 01/07/24.
//

import SwiftUI

struct FirebasePostFormView: View {
    @Binding var isVisible: Bool
    
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

            }.padding(.all)
        }
    }
}

#Preview {
    FirebasePostFormView(isVisible: .constant(false))
}
