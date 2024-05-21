//
//  PersonsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 03/05/24.
//

import SwiftUI
import RealmSwift

struct PersonsView: View {
    @State private var persons: Results<Person>?
    
    var body: some View {
        List() {
            if let persons = persons {
                ForEach(persons) { person in
                    NavigationLink(destination: PersonFormView(person: person)) {
                        VStack(alignment: .leading) {
                            Text(person.name)
                            Text("\(person.age)")
                                .font(.caption)
                        }
                    }.swipeActions {
                        NavigationLink(destination: PetsView(person: person)) {
                            Text("Show pets")
                        }
                        
                        Button(role: .destructive) {
                            do {
                                let realm = try Realm()
                                try realm.write {
                                    realm.delete(person.pets)
                                    realm.delete(person)
                                }
                            } catch let error {
                                debugPrint(error)
                            }
                        } label: {
                            Text("Delete")
                        }
                    }
                }
            }
        }.toolbar(content: {
            NavigationLink(destination: PersonFormView()) {
                Image(systemName: "plus")
            }
        })
        .onAppear {
            do {
                let realm = try Realm()
                persons = realm.objects(Person.self).filter("age > 18")
            } catch let error {
                debugPrint(error)
            }
        }
    }
}

#Preview {
    PersonsView()
}
