//
//  ShapesBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 08/02/22.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1.0)
            .stroke(Color.green, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [50]))
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
