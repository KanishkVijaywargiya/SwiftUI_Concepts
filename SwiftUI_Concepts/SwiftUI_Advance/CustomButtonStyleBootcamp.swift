//
//  CustomButtonStyleBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 19/04/22.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    let scaledAmount: CGFloat
    
    //init(scaledAmount: CGFloat = 0.9) { //without extension
    init(scaledAmount: CGFloat) { //with Extension
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
        //.brightness(configuration.isPressed ? 0.05 : 0)
        .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

// custom view modifiers
struct DefaultButtonViewModifier2: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

// custom view extension
extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
    func withDefaultButtonFormatting2(backgroundColor: Color = .blue) -> some View {
        self.modifier(DefaultButtonViewModifier2(backgroundColor: backgroundColor))
    }
}

struct CustomButtonStyleBootcamp: View {
    var body: some View {
        Button(action: {}) {
            Text("Click Me!")
                .font(.headline)
                .withDefaultButtonFormatting2()
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
        }
        .withPressableStyle(scaledAmount: 0.9) //with extension view
        //.buttonStyle(PressableButtonStyle()) //with init(){...}
        //.buttonStyle(PressableButtonStyle(scaledAmount: 0.9)) //without init(){...}
        .padding(40)
    }
}

struct CustomButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonStyleBootcamp()
    }
}
