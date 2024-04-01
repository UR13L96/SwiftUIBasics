//
//  Contact.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 26/03/24.
//

import Foundation
import CoreData

class Contact: NSManagedObject, Identifiable {
    @NSManaged var name: String
    @NSManaged var lastName: String
    @NSManaged var phone: String
    
    var initials: String {
        return "\(name.first ?? "N")\(lastName.first ?? "A")"
    }
}

extension Contact {
    static func getContacts() -> NSFetchRequest<Contact>? {
        guard let request = Contact.fetchRequest() as? NSFetchRequest<Contact> else {
            return nil
        }
        
        request.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]
        
        return request
    }
}
