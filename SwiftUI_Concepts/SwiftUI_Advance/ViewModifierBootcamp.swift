//
//  Test.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 15/04/22.
//

import SwiftUI

// custom view modifiers
struct DefaultButtonViewModifier: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

// custom view extension
extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        self.modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, World!")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .pink)
                //.modifier(DefaultButtonViewModifier(backgroundColor: .yellow))
            
            Text("Hello, Everyone!")
                .font(.subheadline)
                .withDefaultButtonFormatting(backgroundColor: Color.orange)
            
            Text("Hello!!!")
                .font(.title)
                .withDefaultButtonFormatting()
        }.padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
