//
//  ContactDetailView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 29/03/24.
//

import SwiftUI

struct ContactDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var contact: Contact
    
    var body: some View {
        VStack {
            Text(contact.initials)
                .padding(50)
                .background(Color.gray)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .font(.custom("Arial", size: 100))
            
            Text(contact.name)
                .font(.title)
                .bold()
            
            Text(contact.lastName)
                .font(.headline)
            
            Text(contact.phone)
                .font(.caption)
                .foregroundStyle(Color.secondary)
            
            HStack {
                Button(action: {
                    guard let phone = URL(string: "tel://\(contact.phone)") else {
                        return
                    }
                    
                    UIApplication.shared.open(phone)
                }, label: {
                    Image(systemName: "phone.fill")
                        .modifier(RoundedButton(color: .green))
                })
                
                NavigationLink(destination: ContactFormView(contact: contact)) {
                    Image(systemName: "pencil")
                        .modifier(RoundedButton(color: .blue))
                }
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
    ContactDetailView(contact: Contact())
}
