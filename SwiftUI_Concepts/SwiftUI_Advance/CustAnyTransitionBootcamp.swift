//
//  CustAnyTransitionBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 26/04/22.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    let rotation: Double
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

// custom view extension
extension AnyTransition {
    //as we are in AnyTransition extension no need to use return AnyTransition.
    static var rotating: AnyTransition {
        //return AnyTransition.modifier(
        modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0)
        )
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0)
        )
    }
    
    //custom asymetric animation
    static var rotateOn: AnyTransition {
        asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading))
    }
}


struct CustAnyTransitionBootcamp: View {
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
                    //.transition(.rotating(rotation: 1080))
                    //.transition(AnyTransition.rotating.animation(.easeInOut))
                    //.transition(.move(edge: .leading))
                    //.transition(AnyTransition.scale.animation(.easeInOut))
            }
            Spacer()
            Text("Click Me!").withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 5)) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct CustAnyTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustAnyTransitionBootcamp()
    }
}
