//
//  TextBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 07/02/22.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, World! This is the Swiftful Thinking Bootcamp. I am really enjoring this course and learning a lot.")
            .font(.system(size: 22))
            .bold()
//            .underline()
            .underline(true, color: .red)
            .italic()
            .multilineTextAlignment(.leading)
            .frame(width: 200, height: 100, alignment: .center)
            .foregroundColor(.green)
            .minimumScaleFactor(0.1)
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
