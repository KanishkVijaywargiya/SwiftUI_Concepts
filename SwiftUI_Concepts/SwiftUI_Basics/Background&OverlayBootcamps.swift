//
//  Background&OverlayBootcamps.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 08/02/22.
//

import SwiftUI

struct Background_OverlayBootcamps: View {
    var body: some View {
        Image(systemName: "flame.fill")
            .font(.largeTitle)
            .foregroundColor(.yellow)
            .background(
                Circle().fill(Color.red)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(radius: 20)
                    .overlay(
                        Circle()
                            .fill(Color.white)
                            .frame(width: 25, height: 25)
                            .overlay(
                                Image(systemName: "bell.fill")
                                    .renderingMode(.template)
                                    .font(.system(size: 18, weight: .bold))
                                    .minimumScaleFactor(0.1)
                                    .foregroundColor(.black)
                            )
                        , alignment: .bottomTrailing
                    )
            )
            .background(
                Circle().fill(Color.black)
                    .frame(width: 120, height: 120, alignment: .center)
                    .shadow(radius: 20)
            )
            .overlay(
                Text("Caution")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                    .minimumScaleFactor(0.1)
                    .offset(y: 25)
            )
            .shadow(radius: 10)
    }
}

struct Background_OverlayBootcamps_Previews: PreviewProvider {
    static var previews: some View {
        Background_OverlayBootcamps()
    }
}
