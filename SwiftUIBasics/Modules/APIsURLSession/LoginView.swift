//
//  LoginView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 03/06/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var loginRequest = LoginRequest()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
            TextField("Email", text: $email)
            
            Text("Password")
            SecureField("Password", text: $password)
            
            Button {
                loginRequest.doLogin(email: email, password: password)
            } label: {
                Text("Login")
            }
        }.padding()
    }
}

#Preview {
    LoginView()
}
