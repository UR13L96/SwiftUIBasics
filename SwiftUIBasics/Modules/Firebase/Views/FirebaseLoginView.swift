//
//  FirebaseLoginView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 24/06/24.
//

import SwiftUI

struct FirebaseLoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var logged: Bool
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                
            }, label: {
                Text("Login")
            })
            
            Button(action: {
                
            }, label: {
                Text("Sign Up")
            })
        }
    }
}

#Preview {
    FirebaseLoginView(logged: .constant(false))
}
