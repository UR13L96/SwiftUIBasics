//
//  Song.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 01/03/24.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let name: String
    let artist: String
    let albumImage: String
    let isFavorite: Bool
}
