//
//  ListSwipeActionBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 16/02/22.
//

import SwiftUI

struct ListSwipeActionBootcamp: View {
    @State var fruits: [String] = [
        "apple", "mango", "orange", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(action: {}) {
                            Text("Archive")
                        }
                        .tint(.purple)
                        Button(action: {}) {
                            Text("Flag")
                        }
                        .tint(.orange)
                        Button(action: {}) {
                            Text("Save")
                        }
                        .tint(.green)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button(action: {}) {
                            Text("Pin")
                        }
                        .tint(.yellow)
                    }
            }
        }
    }
}

struct ListSwipeActionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionBootcamp()
    }
}
