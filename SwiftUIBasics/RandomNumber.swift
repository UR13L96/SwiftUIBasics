//
//  RandonNumber.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 04/03/24.
//

import Foundation

class RandomNumber: ObservableObject {
    @Published var number: Int = 0
    @Published var counter = 0
    
    var timer: Timer?
    
    init() {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.number = Int.random(in: 0 ..< 100)
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func restartCounter() {
        counter = 0
    }
}
