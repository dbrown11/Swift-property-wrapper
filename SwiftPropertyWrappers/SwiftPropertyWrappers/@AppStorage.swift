//
//  @AppStorage.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 05/06/2023.
//

// close and open canvas to show example

// In this example, we use @AppStorage to create a binding to the "username" key in UserDefaults. If a value for this key exists, it will be used to initialize username; otherwise, the default value "Guest" will be used.

// The TextField updates username as the user types. Because username is an @AppStorage property, these changes are automatically written to UserDefaults. When the user relaunches the app, their username will be retrieved from UserDefaults and displayed.

import SwiftUI

struct UsernameView: View {
    
    @AppStorage("username") var username: String = "Guest"
    
    @State var firstName: String = "Dom"

    var body: some View {
        VStack {
            Text("User name, \(username)!")
            
            TextField("Enter your username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
            Text("First Name, \(firstName)!")
            
            TextField("Enter your username", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameView()
    }
}
