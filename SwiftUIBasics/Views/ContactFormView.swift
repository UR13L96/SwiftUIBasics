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
                let newContact = Contact(context: viewContext)
                newContact.name = name
                newContact.lastName = lastName
                newContact.phone = phone
                
                do {
                    try viewContext.save()
                    dismiss.callAsFunction()
                } catch let error {
                    print(error.localizedDescription)
                }
            }, label: {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .foregroundStyle(Color.white)
                        .font(.title)
                    Text("Save contact")
                        .foregroundStyle(Color.white)
                        .font(.title)
                }
                    .padding(10)
                    .background(Color.blue)
            })
            
            Spacer()
                .navigationTitle("Add contact")
        }
    }
}

#Preview {
    ContactFormView()
}
