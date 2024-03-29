//
//  ContactDetailView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 29/03/24.
//

import SwiftUI

struct ContactDetailView: View {
    var body: some View {
        VStack {
            Text("AE")
                .padding(50)
                .background(Color.gray)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .font(.custom("Arial", size: 100))
            
            Text("Abel")
                .font(.title)
                .bold()
            
            Text("Eduardo")
                .font(.headline)
            
            Text("1234567890")
                .font(.caption)
                .foregroundStyle(Color.secondary)
            
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "phone.fill")
                        .modifier(RoundedButton(color: .green))
                })
                
                Button(action: {}, label: {
                    Image(systemName: "pencil")
                        .modifier(RoundedButton(color: .blue))
                })
            }
            
            Spacer()
        }
    }
}

struct RoundedButton: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .padding(30)
            .background(color)
            .clipShape(Circle())
            .foregroundStyle(Color.white)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContactDetailView()
}
