//
//  ContentView.swift
//  ObservableObjectDemo
//
//  Created by Davide Troise with Swift 5.0
//  for the YouTube channel "Coding con Davide" https://bit.ly/3QJziJE
//

import SwiftUI

class Contact: ObservableObject {
    var name: String
    @Published var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func haveBirthday() {
        age += 1
    }
}

struct ContentView: View {
    @ObservedObject private var contact = Contact(name: "Davide", age: 41)
    
    var body: some View {
        VStack {
            Button {
                contact.haveBirthday()
            } label: {
                Text("Have birthday")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.red, in: RoundedRectangle(cornerRadius: 12.0))
            }

            Text("\(contact.name) is \(contact.age) years old")
                .font(.title2)
                .foregroundColor(.secondary)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
