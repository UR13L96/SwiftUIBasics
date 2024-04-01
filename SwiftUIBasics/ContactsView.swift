//
//  ContactsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 28/03/24.
//

import SwiftUI
import CoreData

struct ContactsView: View {
    
    @FetchRequest(fetchRequest: Contact.getContacts() ?? NSFetchRequest()) var contacts: FetchedResults<Contact>
    
    var body: some View {
        VStack {
            List(contacts) { contact in
                NavigationLink(destination: ContactDetailView()) {
                    ContactCellView(
                        name: contact.name,
                        lastName: contact.lastName,
                        phone: contact.phone,
                        initials: contact.initials
                    )
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
            
            Spacer()
        }
    }
}

#Preview {
    ContactsView()
}
