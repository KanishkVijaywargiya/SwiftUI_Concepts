//
//  maskBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 26/02/22.
//

import SwiftUI

struct maskBootcamp: View {
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            StarsView.overlay(OverlayView.mask(StarsView))
        }
    }
    
    private var OverlayView: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                //                    .foregroundColor(.green)
                    .fill(
                        LinearGradient(gradient: Gradient(
                                colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))]
                            ),
                            startPoint: .leading,
                            endPoint: .trailing)
                    )
                    .frame(width: CGFloat(rating) / 5 * geo.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var StarsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                //.foregroundColor(rating >= index ? .yellow : .gray)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct maskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        maskBootcamp()
    }
}
