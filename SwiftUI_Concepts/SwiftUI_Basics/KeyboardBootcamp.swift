//
//  KeyboardBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 16/02/22.
//

import SwiftUI

struct KeyboardBootcamp: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
        TextField("Placeholder...", text: $text)
            .submitLabel(.route)
            .onSubmit {
                print("Console!")
            }
            
            TextField("Placeholder...", text: $text)
                .submitLabel(.next)
                .onSubmit {
                    print("Console!")
                }
            
            TextField("Placeholder...", text: $text)
                .submitLabel(.search)
                .onSubmit {
                    print("Console!")
                }
        }
    }
}

struct KeyboardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardBootcamp()
    }
}
