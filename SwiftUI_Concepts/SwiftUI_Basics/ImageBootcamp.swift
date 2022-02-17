//
//  ImageBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 08/02/22.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        VStack {
            Image("img1")
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .font(.largeTitle)
                .foregroundColor(.pink)
                .frame(width: 300, height: 300)
            
            Image("img1")
                .resizable()
                .scaledToFill()
                .font(.largeTitle)
                .foregroundColor(.pink)
                .frame(width: 300, height: 300)
        }
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
