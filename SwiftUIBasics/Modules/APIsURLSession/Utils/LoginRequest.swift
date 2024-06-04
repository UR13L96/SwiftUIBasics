//
//  LoginRequest.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 03/06/24.
//

import SwiftUI
import Combine

class LoginRequest: ObservableObject {
    var didChange = PassthroughSubject<LoginRequest, Never>()
    
    @Published var authenticated = 0 {
        didSet {
            didChange.send(self)
        }
    }
    
    func doLogin(email: String, password: String) {
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        let parameters: [String: String] = [
            "email": email,
            "password": password
        ]
        let body = try? JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, _) in
            guard let data = data else { return }
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                if !loginResponse.token.isEmpty {
                    DispatchQueue.main.async {
                        self.authenticated = 1
                    }
                }
            } catch let error {
                print("Error at login")
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
        }.resume()
    }
}
