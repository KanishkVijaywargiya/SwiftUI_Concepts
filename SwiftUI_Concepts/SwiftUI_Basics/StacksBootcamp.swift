//
//  StacksBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 09/02/22.
//

import SwiftUI

struct StacksBootcamp: View {
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.orange)
                .frame(width: .infinity, height: 100)
            Rectangle()
                .fill(Color.white)
                .overlay(
                    Image("chakra")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90, alignment: .center)
                )
                .frame(width: .infinity, height: 100)
            Rectangle()
                .fill(Color.green)
                .frame(width: .infinity, height: 100)
        }
    }
}

struct StacksBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StacksBootcamp()
    }
}
