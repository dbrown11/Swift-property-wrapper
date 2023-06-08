//
//  @Environment.swift
//  SwiftPropertyWrappers
//
//  Created by Brown, Dominic (D.) on 31/05/2023.
//




import Foundation
import SwiftUI

//Pree determined by swift

// As a side note, while you can modify a lot of environment values, some cannot be changed, like colorScheme or sizeCategory. These are read-only and are defined by the system based on the user's settings.

// Chnge from light to drak in Canvas

// Chnge from size catagory in Canvas

// enviroment

struct EnvironmentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.locale) var locale
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.sizeCategory) var sizeCategory
    
    let number = 1234.56

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Color Scheme: \(colorScheme == .light ? "Light" : "Dark")")
            Text("Locale: \(locale.identifier)")
            Text("Layout Direction: \(layoutDirection == .leftToRight ? "LTR" : "RTL")")
            Text("Size Category: \(sizeCategory.description)")
            
            Text("Default Locale: \(number)")
            
            Text("French Locale: \(number)")
                .environment(\.locale, .init(identifier: "fr_FR"))
            
            Text("German Locale: \(number, specifier: "%.2f")")
                .environment(\.locale, .init(identifier: "de_DE"))
            
        }.padding()
    }
}


// A small extension to get a displayable string for ContentSizeCategory
extension ContentSizeCategory {
    var description: String {
        switch self {
        case .extraSmall:
            return "Extra Small"
        case .small:
            return "Small"
        case .medium:
            return "Medium"
        case .large:
            return "Large"
        case .extraLarge:
            return "Extra Large"
        case .extraExtraLarge:
            return "Extra Extra Large"
        case .extraExtraExtraLarge:
            return "Extra Extra Extra Large"
        case .accessibilityMedium:
            return "Accessibility Medium"
        case .accessibilityLarge:
            return "Accessibility Large"
        case .accessibilityExtraLarge:
            return "Accessibility Extra Large"
        case .accessibilityExtraExtraLarge:
            return "Accessibility Extra Extra Large"
        case .accessibilityExtraExtraExtraLarge:
            return "Accessibility Extra Extra Extra Large"
        @unknown default:
            return "Unknown"
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EnvironmentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                .previewDisplayName("iPhone 12")

            EnvironmentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .environment(\.layoutDirection, .rightToLeft)
                .environment(\.locale, Locale(identifier: "ar"))
                .previewDisplayName("iPhone 12 Pro Max - Accessibility Extra Extra Extra Large - RTL - Arabic")
        }
    }
}
