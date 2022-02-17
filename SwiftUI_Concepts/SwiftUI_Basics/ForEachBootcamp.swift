//
//  ForEachBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 13/02/22.
//

import SwiftUI

struct ForEachBootcamp: View {
    let data: [String] = ["Hi", "Good Evening", "Kanishk Vijaywargiya"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
            ForEach(data.indices) { index in
                Text("\(data[index]): \(index)")
            }
        }
    }
}

struct ForEachBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachBootcamp()
    }
}
