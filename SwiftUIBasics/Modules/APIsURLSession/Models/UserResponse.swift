//
//  UserResponse.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 27/05/24.
//

import Foundation

struct UserResponse: Decodable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
