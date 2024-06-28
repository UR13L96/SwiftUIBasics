//
//  FirebaseLoginView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 24/06/24.
//

import SwiftUI
import FirebaseAuth

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
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if user != nil {
                        UserDefaults.standard.set(true, forKey: "FirebaseLogged")
                        self.logged = true
                    } else {
                        if let error = error?.localizedDescription {
                            print("FirebaseAuth", error)
                        }
                    }
                }
            }, label: {
                Text("Login")
            })
            
            Button(action: {
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    if user != nil {
                        print("Registered")
                    } else {
                        if let error = error?.localizedDescription {
                            print("FirebaseAuth", error)
                        }
                    }
                    
                }
            }, label: {
                Text("Sign Up")
            })
        }.padding(.all)
    }
}

#Preview {
    FirebaseLoginView(logged: .constant(false))
}
