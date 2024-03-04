//
//  RandonNumber.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 04/03/24.
//

import Foundation

class RandomNumber: ObservableObject {
    @Published var number: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            self.number = Int.random(in: 0 ..< 100)
        }
    }
}
