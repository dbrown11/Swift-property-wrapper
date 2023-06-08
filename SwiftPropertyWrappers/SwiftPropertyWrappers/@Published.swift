//
//  @Published.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 05/06/2023.
//


//In this example, the PublishedView includes two buttons. The first increments publishedCount, which is marked with @Published. Because @Published notifies the view of changes, the view will refresh and display the new value.

//The second button increments regularCount, which is a regular property. Because regularCount isn't marked with @Published, the view isn't notified of changes to this property. So even though regularCount is being incremented, the view doesn't refresh to display the new value.

import SwiftUI

class PublishedModel: ObservableObject {
    @Published var publishedCount = 0
    var regularCount = 0
}

struct PublishedView: View {
    @ObservedObject var counterModel = PublishedModel()
    
    var body: some View {
        VStack {
            Text("Published count: \(counterModel.publishedCount)")
            Button(action: {
                self.counterModel.publishedCount += 1
            }) {
                Text("Increment Published Count")
            }
            
            Text("Regular count: \(counterModel.regularCount)")
            Button(action: {
                self.counterModel.regularCount += 1
            }) {
                Text("Increment Regular Count")
            }
        }
    }
}

struct PublishedView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedView()
    }
}
