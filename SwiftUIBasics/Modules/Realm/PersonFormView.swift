//
//  PersonFormView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 06/05/24.
//

import SwiftUI
import RealmSwift

struct PersonFormView: View {
    @State private var name = ""
    @State private var age = ""
    
    @State private var petName = ""
    @State private var petType = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var person: Person?
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(person == nil ? "Add" : "Update") person")
                .font(.title)
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Age", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                if person == nil {
                    createPerson()
                } else {
                    updatePerson()
                }
            }, label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(Color.white)
                        .font(.title)
                    
                    Text("Save person")
                        .font(.title)
                        .foregroundStyle(Color.white)
                }
            })
                .padding(10)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            if person != nil {
                Text("Save pet")
                    .font(.title)
                
                TextField("Name", text: $petName)
                
                TextField("Type", text: $petType)
                
                Button {
                    savePet()
                } label: {
                    Text("Save pet")
                }

            }
            
            Spacer()
        }
        .padding(.all)
        .onAppear {
            if let person = person {
                name = person.name
                age = String(person.age)
            }
        }
    }
    
    private func createPerson() {
        do {
            let realm = try Realm()
            
            let person = Person()
            person.name = name
            person.age = Int(age) ?? 0
            
            try realm.write {
                realm.add(person)
                dismiss.callAsFunction()
            }
        } catch let error {
            debugPrint(error)
        }
    }
    
    private func updatePerson() {
        do {
            let realm = try Realm()
            
            try realm.write {
                if let person = person {
                    person.name = name
                    person.age = Int(age) ?? 0
                }
                
                dismiss.callAsFunction()
            }
        } catch let error {
            debugPrint(error)
        }
    }
    
    private func savePet() {
        do {
            let realm = try Realm()
            let pet = Pet()
            pet.name = petName
            pet.type = petType
            if let personID = person?.id {
                pet.personID = personID
            }
            
            try realm.write {
                self.person?.pets.append(pet)
            }
        } catch let error {
            print(error)
        }
    }
}

#Preview {
    PersonFormView()
}
