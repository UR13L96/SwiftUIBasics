//
//  Place.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 08/04/24.
//

import Foundation
import CoreData

class Place: NSManagedObject {
    @NSManaged public var name: String
    @NSManaged public var image: Data
}
