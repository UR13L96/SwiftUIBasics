//
//  Pet.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 14/05/24.
//

import Foundation
import RealmSwift

class Pet: Object, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var type = ""
    
    @objc dynamic var personID = ""
    
    @objc dynamic var owner: Person? {
        return LinkingObjects(fromType: Person.self, property: "personID").first
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
