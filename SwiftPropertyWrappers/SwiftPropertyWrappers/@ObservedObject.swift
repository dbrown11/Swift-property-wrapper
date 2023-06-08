//
//  @ObservedObject.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 05/06/2023.
//


// While SwiftUI is smart enough to understand the difference between @StateObject and @ObservedObject, it's also important for human readers of your code to understand how objects are supposed to be used.

// When you see @StateObject in code, you can assume that this object is being created and owned by the view itself.
// When you see @ObservedObject, you can assume that this object is created somewhere else, and the view is merely observing it.

import SwiftUI

struct IncorrectIncrementView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Go to first child view") {
                    IncorrectChildView()
                }
                
                NavigationLink("Go to second child view") {
                    IncorrectChildView()
                }
            }
        }
    }
}

struct IncorrectChildView: View {
    
    @StateObject private var incrementer = IncrementModell()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("@StateObject").bold()
                Text("Count: \(incrementer.count)")
                Button(action: {
                    incrementer.count += 1
                }) {
                    Text("Increment Count")
                }
                .padding(.bottom)
            }
        }
    }
}

struct IncorrectIncrementView_Previews: PreviewProvider {
    static var previews: some View {
        IncorrectIncrementView()
    }
}


struct CorrectIncrementView: View {
    
    @StateObject private var incrementer = IncrementModell()
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Go to first child view") {
                    CorrectChildView(incrementer: incrementer)
                }
                
                NavigationLink("Go to second child view") {
                    CorrectChildView(incrementer: incrementer)
                }
            }
        }
    }
}

struct CorrectChildView: View {
    
    // could alos be another  @StateObject :( but thats just not good form OK! 
    @ObservedObject var incrementer: IncrementModell
    
    var body: some View {
        VStack {
            Text("@ObservedObject").bold()
            Text("Count: \(incrementer.count)")
            Button(action: {
                incrementer.count += 1
            }) {
                Text("Increment Count")
            }
            .padding(.bottom)
        }
    }
}

struct CorrectIncrementView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectIncrementView()
    }
}


//Although you've declared incrementerStateObject in IncrementChildView_ObservedObject as @StateObject, it doesn't create a new object. Instead, it refers to the existing IncrementModell object passed from IncrementView_ObservedObject. This is because the initial value (incrementerStateObject) passed to IncrementChildView_ObservedObject already contains a reference to the original object. In other words, Swift uses the reference from IncrementView_ObservedObject and doesn't create a new one.

//So, when you modify incrementerStateObject.count in IncrementChildView_ObservedObject, you're actually updating the original IncrementModell object that was created in IncrementView_ObservedObject. That's why you see the updated count in IncrementView_ObservedObject after navigating back from IncrementChildView_ObservedObject.

//To put it simply: SwiftUI is smart enough to realize that incrementerStateObject already exists, and it shouldn't create a new one.

//However, it's worth mentioning that this usage can be misleading and is generally discouraged because @StateObject should be used for objects that the view itself owns and manages, whereas @ObservedObject should be used for objects that are owned by some other piece of code but the view still needs to read.

//struct IncrementView_ObservedObject: View {
//
//    @StateObject  var incrementerStateObject = IncrementModell()
//    @StateObject  var incrementerObservedObject = IncrementModell()
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                Text("@StateObject").bold()
//                Text("Count: \(incrementerStateObject.count)")
//
//                    .padding(.bottom)
//
//                Text("@ObservedObject").bold()
//                Text("Count: \(incrementerObservedObject.count)")
//
//                NavigationLink("Go to child view") {
//                    IncrementChildView_ObservedObject(incrementerStateObject: incrementerStateObject, incrementerObservedObject: incrementerObservedObject)
//                }
//            }
//        }
//    }
//}
//
//struct IncrementChildView_ObservedObject: View {
////    @State private var chagneColoe: Bool = false
//
//    @StateObject  var incrementerStateObject: IncrementModell
//    @ObservedObject  var incrementerObservedObject : IncrementModell
//
//    var body: some View {
//        VStack {
//            Text("@State").bold()
//            Text("Count: \(incrementerStateObject.count)")
//            Button(action: {
//                incrementerStateObject.count += 1
//            }) {
//                Text("Increment State Count")
//            }
//            .padding(.bottom)
//
//            Text("@StateObject").bold()
//            Text("Count: \(incrementerObservedObject.count)")
//            Button(action: {
//                incrementerObservedObject.count += 1
//            }) {
//                Text("Increment State Object Count")
//            }
//        }
//    }
//}
//
//
//struct IncrementView_ObservedObject_Previews: PreviewProvider {
//    static var previews: some View {
//        IncrementView_ObservedObject()
//    }
//}
