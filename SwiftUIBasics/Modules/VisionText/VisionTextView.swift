//
//  VisionTextView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 05/03/25.
//

import SwiftUI

struct VisionTextView: View {
    @State private var isShowingScanner = false
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text("Text recognition")
            
            Button {
                isShowingScanner = true
            } label: {
                Text("Scan")
                    .foregroundStyle(Color.white)
                    
            }.padding(12)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(text)
                .lineLimit(nil)
        }.sheet(isPresented: $isShowingScanner) {
            ScannerView { texts in
                if let text = texts?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                    self.text = text
                }
                
                isShowingScanner = false
            }
        }
    }
}

#Preview {
    VisionTextView()
}
