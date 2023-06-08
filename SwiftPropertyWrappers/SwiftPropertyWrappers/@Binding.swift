//
//  @Binding.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 05/06/2023.
//

import SwiftUI

struct BindingParentView: View {
    @State private var numberCount = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Current Count: \(numberCount)")
                
                NavigationLink("Increase with Binding") {
                    BindingChildView(selectedNumber: $numberCount)
                }
                NavigationLink("Increase withought Binding") {
                    NonBindingChildView(selectedNumber: numberCount)
                }
            }
        }
    }
}

struct BindingChildView: View {
    @Binding var selectedNumber: Int
    
    var body: some View {
        Button("Increment number in BindingChildView") {
            selectedNumber += 1
        }
    }
}

struct NonBindingChildView: View {
    var selectedNumber: Int
    
    var body: some View {
        Button("Increment number in NonBindingChildView") {
            print("This won't work, because 'selectedNumber' isn't a @Binding")
        }
    }
}

struct BindingParentView_Previews: PreviewProvider {
    static var previews: some View {
        BindingParentView()
    }
}
