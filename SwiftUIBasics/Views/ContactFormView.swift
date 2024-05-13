//
//  ContactFormView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 28/03/24.
//

import SwiftUI

struct ContactFormView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    var contact: Contact? = nil
    
    @State private var name = ""
    @State private var lastName = ""
    @State private var phone = ""
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding(10)
            
            TextField("Last Name", text: $lastName)
                .padding(10)
            
            TextField("Phone", text: $phone)
                .padding(10)
                .keyboardType(.phonePad)
            
            Button(action: {
                if let contact = contact {
                    contact.name = name
                    contact.lastName = lastName
                    contact.phone = phone
                } else {
                    let newContact = Contact(context: viewContext)
                    newContact.name = name
                    newContact.lastName = lastName
                    newContact.phone = phone
                }
                
                do {
                    try viewContext.save()
                    dismiss.callAsFunction()
                } catch let error {
                    print(error.localizedDescription)
                }
            }, label: {
                HStack {
                    Image(systemName: contact == nil ? "person.crop.circle" : "pencil")
                        .foregroundStyle(Color.white)
                        .font(.title)
                    Text(contact == nil ? "Add contact" : "Edit contact")
                        .foregroundStyle(Color.white)
                        .font(.title)
                }
                    .padding(10)
                    .background(Color.blue)
            })
            
            Spacer()
                .navigationTitle(contact == nil ? "Add contact" : "Edit contact")
        }.onAppear {
            name = contact?.name ?? ""
            lastName = contact?.lastName ?? ""
            phone = contact?.phone ?? ""
        }
    }
}

#Preview {
    ContactFormView()
}
