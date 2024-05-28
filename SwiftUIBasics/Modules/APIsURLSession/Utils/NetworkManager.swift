//
//  NetworkManager.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 28/05/24.
//

import SwiftUI
import Combine

class NetworkManager: ObservableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    
    @Published var baseResponse = BaseResponse(data: []) {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://reqres.in/api/users?page=1") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, _ in
            do {
                guard let data = data else { return }
                let users = try JSONDecoder().decode(BaseResponse.self, from: data)
                print(users)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
