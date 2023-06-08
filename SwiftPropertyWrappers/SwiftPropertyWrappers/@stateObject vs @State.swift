//
//  @stateObject vs @State.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 05/06/2023.
//


// In your example, IncrementModell is a reference type (because it's a class), and it's designed to be used with @StateObject. Here's what happens when you use IncrementModell with @State and @StateObject:

//incrementerState: When used with @State, the IncrementModell object will behave like a value type. This means it doesn't share its state between the view and other objects or views. When you increase incrementerState.count, the count is increased in the local copy of IncrementModell, but the change isn't reflected in the view, as SwiftUI doesn't know to redraw the view.

//incrementerStateObject: When used with @StateObject, the IncrementModell object will behave like a reference type. The @StateObject wrapper creates a persistent, application-lifetime object that SwiftUI will update whenever the published properties of IncrementModell change. When you increase incrementerStateObject.count, the view is notified of the change and redraws the relevant parts of the view.

//The @StateObject and ObservableObject combination is powerful because it allows data to be shared and mutated across views. In contrast, @State is designed for private data owned by a single view, and isn't intended to be shared across views. For complex, mutable, sharable state, @StateObject should be used.

//_______

//The reason the changeColor state variable works as expected is that it's a value type (Bool), which is the intended use case for the @State property wrapper. It's owned by a single view and doesn't need to be shared across views. When you uncomment the Circle view, it will change color each time either button is pressed because the changeColor state variable is toggled in both button action closures.


import SwiftUI

class IncrementModell: ObservableObject {
    @Published var count: Int = 0
}

struct IncrementView_StateVS_StateObject: View {
    @State private var chagneColoe: Bool = false
    
    @State private var incrementerState = IncrementModell()
    @StateObject private var incrementerStateObject = IncrementModell()
    
    var body: some View {
        VStack {
            Text("@State").bold()
            Text("Count: \(incrementerState.count)")
            Button(action: {
                incrementerState.count += 1
                chagneColoe.toggle()
            }) {
                Text("Increment State Count")
            }
            .padding(.bottom)
            
            Text("@StateObject").bold()
            Text("Count: \(incrementerStateObject.count)")
            Button(action: {
                incrementerStateObject.count += 1
                chagneColoe.toggle()
            }) {
                Text("Increment State Object Count")
            }
            
            Circle().foregroundColor(chagneColoe ? .green : .blue)
                .frame(width: 300, height: 300)
        }
    }
}



struct IncrementViewV2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IncrementView_StateVS_StateObject()
        }
    }
}

