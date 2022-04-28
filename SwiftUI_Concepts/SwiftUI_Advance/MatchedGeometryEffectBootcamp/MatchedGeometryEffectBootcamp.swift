//
//  MatchedGeometryEffectBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 26/04/22.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green.opacity(0.5))
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 350, height: 400)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                /**
                 ScrollView {
                 VStack(spacing: 40) {
                 ForEach(0..<10, id: \.self) { item in
                 RoundedRectangle(cornerRadius: 25)
                 .fill(Color.green.opacity(0.5))
                 .matchedGeometryEffect(id: item, in: namespace)
                 .frame(width: 350, height: 400)
                 .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                 }
                 }
                 }
                 **/
            }
            Spacer()
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.yellow.opacity(0.5))
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectBootcamp()
    }
}
