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
                    VStack(alignment: .leading) {
                        Text(person.name)
                        Text("\(person.age)")
                            .font(.caption)
                    }
                }.onDelete { index in
                    if let index = index.first {
                        let person = persons[index]
                        
                        do {
                            let realm = try Realm()
                            try realm.write {
                                realm.delete(person)
                            }
                        } catch let error {
                            debugPrint(error)
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
