//
//  @State.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 05/06/2023.
//


//The @State property wrapper is specific to SwiftUI and it is used to indicate that a value will change and, when it does, the view should re-render to reflect that change. This concept is fundamental to SwiftUI's declarative programming model.


import SwiftUI

// In the example above, we've commented out the isOn.toggle() line because it would result in a compile-time error, due to the attempt to mutate a non-@State property.

struct StaticButtonView: View {
    private var isOn = false
    
    var name: String = "Ted"

    var body: some View {
        Button(action: {
            // This mutation is local to the Button's action closure
            // and won't affect the rendering of the view.
//            isOn.toggle()
        }) {
            Text(isOn ? "ON" : "OFF")
        }
        
//        TextField("Name change", text: $name)

    }
}


struct StaticButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StaticButtonView()
    }
}



struct ToggleButtonView: View {
    
    @State private var isOn = false // @State property
    
    @State var name: String = ""


    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                isOn.toggle() // this is valid because isOn is a @State property
            }) {
                Text(isOn ? "ON" : "OFF")
            }
            Form {
                TextField("Name change", text: $name)
            }
            Spacer()
        }

    }
}

struct ToggleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButtonView()
    }
}
