//
//  Person.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 03/05/24.
//

import Foundation
import RealmSwift

class Person: Object, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
