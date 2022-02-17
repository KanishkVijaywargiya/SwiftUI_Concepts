//
//  AnimationTimingBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 14/02/22.
//

import SwiftUI

struct AnimationTimingBootcamp: View {
    @State var isAnimate: Bool = false
    let timing: Double = 10
    
    var body: some View {
        VStack {
            Button(action: {isAnimate.toggle()}) {
                Text("Press me")
            }
            RoundedRectangle(cornerRadius: isAnimate ? 20 : 0)
                .frame(width: isAnimate ? 350 : 50, height: 100)
                .animation(.spring(
                    response: 0.5,
                    dampingFraction: 0.7,
                    blendDuration: 1.0))
//                .animation(.spring())
            
            RoundedRectangle(cornerRadius: isAnimate ? 20 : 0)
                .frame(width: isAnimate ? 350 : 50, height: 100)
                .animation(Animation.linear(duration: timing))
            
            RoundedRectangle(cornerRadius: isAnimate ? 20 : 0)
                .frame(width: isAnimate ? 350 : 50, height: 100)
                .animation(Animation.linear)
            
            RoundedRectangle(cornerRadius: isAnimate ? 20 : 0)
                .frame(width: isAnimate ? 350 : 50, height: 100)
                .animation(Animation.easeIn)
            
            RoundedRectangle(cornerRadius: isAnimate ? 20 : 0)
                .frame(width: isAnimate ? 350 : 50, height: 100)
                .animation(Animation.easeInOut)
            
            RoundedRectangle(cornerRadius: isAnimate ? 20 : 0)
                .frame(width: isAnimate ? 350 : 50, height: 100)
                .animation(Animation.easeOut)
        }
    }
}

struct AnimationTimingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingBootcamp()
    }
}
