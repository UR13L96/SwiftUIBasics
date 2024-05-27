//
//  ResponseBase.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 27/05/24.
//

import Foundation

struct BaseResponse: Decodable {
    let data: [UserResponse]
}
