//
//  ContactsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 28/03/24.
//

import SwiftUI
import CoreData

struct ContactsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Contact.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Contact.name, ascending: true)]
    ) var contacts: FetchedResults<Contact>
    
    var body: some View {
        VStack {
            List() {
                ForEach(contacts) { contact in
                    NavigationLink(destination: ContactDetailView(contact: contact)) {
                        ContactCellView(
                            name: contact.name,
                            lastName: contact.lastName,
                            phone: contact.phone,
                            initials: contact.initials
                        )
                    }
                }.onDelete { index in
                    if let index = index.first {
                        let contact = contacts[index]
                        viewContext.delete(contact)
                        
                        do {
                            try viewContext.save()
                        } catch let error {
                            debugPrint(error.localizedDescription)
                        }
                    }
                }
            }
            
            NavigationLink(destination: ContactFormView()) {
                Image(systemName: "plus.app.fill")
                    .foregroundStyle(Color.white)
                    .font(.title)
                Text("Save")
                    .foregroundStyle(Color.white)
                    .font(.title)
            }
                .padding(10)
                .background(Color.green)
                .navigationTitle("Contacts")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    EditButton()
                }
            
            Spacer()
        }
    }
}

#Preview {
    ContactsView()
}
