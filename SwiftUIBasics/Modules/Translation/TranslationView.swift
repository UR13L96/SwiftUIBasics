//
//  TranslationView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 27/02/25.
//

import SwiftUI

struct TranslationView: View {
    @State private var isShowingAlert = false
    @State private var date: Date = Date()
    
    var body: some View {
        VStack {
            Text("title")
                .font(.largeTitle)
            
            Button {
                isShowingAlert.toggle()
            } label: {
                Text("translation.show.alert")
            }
            .alert("translation.alert.title", isPresented: $isShowingAlert) {
                Button {
                    
                } label: {
                    Text("translation.button.confirm")
                }

            } message: {
                Text("translation.button.message")
            }

            Form {
                DatePicker(selection: $date, displayedComponents: .date) {
                    Text("translation.date.title")
                }
                
                Text("\(date)")
                
                Image("greeting")
            }
        }
    }
}

#Preview {
    TranslationView()
}
