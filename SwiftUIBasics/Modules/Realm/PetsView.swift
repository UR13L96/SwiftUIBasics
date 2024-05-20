//
//  PetsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 17/05/24.
//

import SwiftUI
import RealmSwift

struct PetsView: View {
    @State private var pets: Results<Pet>?
    
    var person: Person?
    
    var body: some View {
        List {
            if let pets = pets {
                ForEach(pets) { pet in
                    VStack(alignment: .leading) {
                        Text(pet.name)
                        Text("\(pet.type)")
                            .font(.caption)
                    }
                }
            }
        }
        .onAppear {
            do {
                let realm = try Realm()
                self.pets = realm.objects(Pet.self)
            } catch let error {
                debugPrint(error)
            }
        }
    }
}

#Preview {
    PetsView()
}
