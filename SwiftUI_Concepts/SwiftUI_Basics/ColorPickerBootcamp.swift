//
//  ColorPickerBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 16/02/22.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    @State var backgroundColor: Color = .green
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            ColorPicker(
                "Select a color",
                selection: $backgroundColor,
                supportsOpacity: true)
                .padding()
                .background(Color.black)
                .cornerRadius(20)
                .foregroundColor(.white)
                .font(.headline)
                .padding(50)
        }
    }
}

struct ColorPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBootcamp()
    }
}
