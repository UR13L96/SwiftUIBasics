//
//  PersonFormView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 06/05/24.
//

import SwiftUI

struct PersonFormView: View {
    @State private var name = ""
    @State private var age = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Agregar persona")
                .font(.title)
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Age", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                print("Will save person")
            }, label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(Color.white)
                        .font(.title)
                    
                    Text("Save person")
                        .font(.title)
                        .foregroundStyle(Color.white)
                }
            })
                .padding(10)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .padding(.all)
    }
}

#Preview {
    PersonFormView()
}
