//
//  ScrollViewReaderBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 26/02/22.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Enter a number here...", text: $textFieldText)
                .frame(height: 55)
                .padding(.horizontal)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button(action: {
                if let index = Int(textFieldText) {
                    scrollToIndex = index
                }
            }) {
                Text("Scroll now")
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    //                    Button(action: {
                    //                        withAnimation(.spring()) {
                    //                            // anchor: .top, .bottom, .center, nil
                    //                            proxy.scrollTo(30, anchor: .top)
                    //                        }
                    //                    }) {
                    //                        Text("Click here to go to #30")
                    //                    }
                    
                    ForEach(0..<50) {
                        Text("This is item #\($0)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id($0)
                    }
                    .onChange(of: scrollToIndex) { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
