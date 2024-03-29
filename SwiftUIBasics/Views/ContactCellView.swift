//
//  ContactCellView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 29/03/24.
//

import SwiftUI

struct ContactCellView: View {
    var body: some View {
        HStack {
            Text("AE")
                .padding(20)
                .background(Color.gray)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .font(.title)
            
            VStack(alignment: .leading) {
                Text("Abel")
                    .font(.title)
                    .bold()
                
                Text("Eduardo")
                    .font(.headline)
                
                Text("1234567890")
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
            }
        }
    }
}

#Preview {
    ContactCellView()
}
