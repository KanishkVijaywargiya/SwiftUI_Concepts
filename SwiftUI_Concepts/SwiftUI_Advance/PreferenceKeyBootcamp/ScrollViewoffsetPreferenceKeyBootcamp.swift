//
//  ScrollViewoffsetPreferenceKeyBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 20/05/22.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func onScrollViewOffsetChange(action: @escaping (_ offset: CGFloat) -> ()) -> some View {
        self.background(
            GeometryReader { geo in
                Text("").preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
            }
        )
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            action(value)
        }
    }
}

struct ScrollViewoffsetPreferenceKeyBootcamp: View {
    let title: String = "New Title here !!!"
    @State private var scrollViewOffset: CGFloat = 0
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(Double(scrollViewOffset) / 63.0)
                /*
                 .background(
                 GeometryReader { geo in
                 Text("").preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                 }
                 )
                 */
                    .onScrollViewOffsetChange { value in
                        withAnimation(.easeInOut) {
                            self.scrollViewOffset = value
                        }
                    }
                contentLayer
            }
            .padding()
        }
        .overlay(Text("\(scrollViewOffset)"))
        /*
         .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
         self.scrollViewOffset = value
         }
         */
        .overlay(rectangleNavBarLayer.opacity(scrollViewOffset < 20 ? 1.0 : 0.0)
                 , alignment: .top)
    }
}

struct ScrollViewoffsetPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewoffsetPreferenceKeyBootcamp()
    }
}

extension ScrollViewoffsetPreferenceKeyBootcamp {
    private var titleLayer: some View {
        Text(title).font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var contentLayer: some View {
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 10).fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBarLayer: some View {
        Text(title).font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
    
    private var rectangleNavBarLayer: some View {
        Rectangle().fill(.clear)
            .frame(maxWidth: .infinity)
            .frame(height: 1)
            .background(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
    }
}
