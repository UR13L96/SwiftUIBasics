//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 22/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlertVisible: Bool = false
    var alert: Alert {
        Alert(title: Text("ALERT"), message: Text("I'm an alert"), dismissButton: .default(Text("Confirm"), action: {
            print("My first alert in SwiftUI")
        }))
    }
    
    @State private var isConfirmationDialogVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("SwiftUI Course")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .underline()
            Text("Welcome to the course")
                .font(.subheadline)
                .foregroundColor(.green)
                .bold()
            Spacer()
            Image("ocarina")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
                .clipShape(.circle)
            Spacer()
            HStack(alignment: .center, spacing: 8) {
                Button(action: {
                    isAlertVisible.toggle()
                }) {
                    Label("ALERT", systemImage: "exclamationmark.triangle.fill")
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .alert(isPresented: $isAlertVisible, content: {
                    alert
                })
                
                Button(action: {
                    isConfirmationDialogVisible.toggle()
                }) {
                    Label("CONFIRMATION DIALOG", systemImage: "folder.fill")
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
                .confirmationDialog("MENU", isPresented: $isConfirmationDialogVisible) {
                    Button("Galery", action: {
                        print("Galery selected")
                    })
                    Button("Camera", action: {
                        print("Camera selected")
                    })
                    Button(role: .cancel, action: {}) {
                        Text("Cancel")
                    }
                } message: {
                    Text("Select an option")
                }

            }
        }.padding(.all)
    }
}

#Preview {
    ContentView()
}

