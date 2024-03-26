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
}
