//
//  @StateObject.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 31/05/2023.
//

import SwiftUI


//CounterView using a normal variable won't work because it's trying to mutate a value inside the View struct, which is not allowed. On the other hand, IncrementView using @StateObject works perfectly. The @StateObject property wrapper allows IncrementView to mutate and observe the IncrementModel object.


// Regular variable example (won't work)
class CounterModel {
    var count: Int = 0
}

struct CounterView: View {
    private var counter = CounterModel()

    var body: some View {
        VStack {
            Text("Count: \(counter.count)")
            Button(action: {
                counter.count += 1
            }) {
                Text("Increment Count")
            }
        }
    }
}

// StateObject example (works)
class IncrementModel: ObservableObject {
    @Published var count: Int = 0
}

struct IncrementView: View {
    @StateObject private var incrementer = IncrementModel() // must be Observable Object

    var body: some View {
        VStack {
            Text("Count: \(incrementer.count)")
            Button(action: {
                incrementer.count += 1
            }) {
                Text("Increment Count")
            }
        }
    }
}

// Previews
struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}

struct IncrementView_Previews: PreviewProvider {
    static var previews: some View {
        IncrementView()
    }
}
