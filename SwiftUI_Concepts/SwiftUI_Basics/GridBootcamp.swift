//
//  GridBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 13/02/22.
//

import SwiftUI

struct GridBootcamp: View {
    let columns1: [GridItem] = [
        GridItem(.fixed(50), spacing: nil, alignment: nil),
        GridItem(.fixed(75), spacing: nil, alignment: nil),
        GridItem(.fixed(100), spacing: nil, alignment: nil),
        GridItem(.fixed(85), spacing: nil, alignment: nil),
        GridItem(.fixed(50), spacing: nil, alignment: nil)
    ]
    let columns2: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    let columns3: [GridItem] = [
        GridItem(.adaptive(minimum: 50, maximum: 300), spacing: nil, alignment: nil),
        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.orange)
                .frame(height: 400)
            
            LazyVGrid(
                columns: columns2,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders]) {
                    Section(header:
                                Text("Section 1")
                                .foregroundColor(.white)
                                .font(.title.bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.blue)
                                .padding()
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .frame(height: 150)
                        }
                    }
                    Section(header:
                                Text("Section 2")
                                .foregroundColor(.white)
                                .font(.title.bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.red)
                                .padding()
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(Color.green)
                                .frame(height: 150)
                        }
                    }
                }
            
            //            LazyVGrid(columns: columns2) {
            //                ForEach(0..<50) { index in
            //                    Rectangle()
            //                        .frame(height: 150)
            //                }
            //            }
        }
    }
}

struct GridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GridBootcamp()
    }
}
