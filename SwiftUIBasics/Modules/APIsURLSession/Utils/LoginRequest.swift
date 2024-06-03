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
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            print(data)
        }.resume()
    }
}
