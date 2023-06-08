//
//  ContentView.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                .imageScale(.large)
                
            Text("Hello, world!")
            Button() {
                print("ButtonPrerssed")
            } label: {
                Text("Button")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
