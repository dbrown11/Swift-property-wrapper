//
//  @EnvironmentObject.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 31/05/2023.
//

import SwiftUI

// + Publisher

class UserSettings: ObservableObject {
    @Published var username = "John Doe"
}


struct EnvironmentObjectView: View {
    
    var body: some View {
        
        var userSettings = UserSettings()
        
        let age: Int = 34
        
        // Everythign within the NavigationView (or NavigationStack can access the .environmentObject(Object)
         NavigationView {
             VStack {
                 Text("Username: \(userSettings.username)")
                     .padding(.bottom)
                 NavigationLink(
                    destination: ChildView(),
                    label: { Text("Go to ChildView") }
                 )
             }
         }
         .environmentObject(userSettings) // Must be an Observable Object!!
//         .environmentObject(age)
     }
}

// Child view was skipped! :O
struct ChildView: View {
    
    var body: some View {
        NavigationLink(
            destination: GrandChildView(),
            label: { Text("Go to GrandChildView") }
        )
    }
    
}

struct GrandChildView: View {
    
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        Text("Username: \(userSettings.username)")
        
        TextField("UserName", text: $userSettings.username)
    }
    
}

struct EnvironmentObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
