//
//  AnimationBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 14/02/22.
//

import SwiftUI

struct AnimationBootcamp: View {
    @State var isAnimation: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
//                withAnimation(Animation.default.delay(2))
//                withAnimation(Animation.default.repeatCount(5, autoreverses: false))
//                {
//                    isAnimation.toggle()
//                }
                isAnimation.toggle()
            }) {
                Text("Press Me")
            }
            
            RoundedRectangle(cornerRadius: isAnimation ? 50 : 25, style: .continuous)
                .fill(isAnimation ? Color.green : Color.purple)
                .frame(width: isAnimation ? 100 : 300, height: isAnimation ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimation ? 360 : 0))
                .offset(y: isAnimation ? 300 : 0)
                .shadow(radius: 10)
                .animation(
                    Animation.default.repeatForever(autoreverses: false)
                )
        }
    }
}

struct AnimationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBootcamp()
    }
}
