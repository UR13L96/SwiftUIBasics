//
//  ContactCellView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 29/03/24.
//

import SwiftUI

struct ContactCellView: View {
    var name: String
    var lastName: String
    var phone: String
    var initials: String
    
    var body: some View {
        HStack {
            Text(initials)
                .padding(20)
                .background(Color.gray)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .font(.title)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .bold()
                
                Text(lastName)
                    .font(.headline)
                
                Text(phone)
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
            }
        }
    }
}

#Preview {
    ContactCellView(name: "", lastName: "", phone: "", initials: "")
}
