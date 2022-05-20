//
//  ViewBuilderBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 16/05/22.
//

import SwiftUI

struct HeaderViewRegular: View {
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.largeTitle).fontWeight(.semibold)
            if let description = description {
                Text(description).font(.callout)
            }
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            RoundedRectangle(cornerRadius: 5).frame(height: 2)
        }.frame(maxWidth: .infinity, alignment: .leading).padding()
    }
}

struct HeaderViewGeneric<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.largeTitle).fontWeight(.semibold)
            content
            RoundedRectangle(cornerRadius: 5).frame(height: 2)
        }.frame(maxWidth: .infinity, alignment: .leading).padding()
    }
}

struct CustomHStack<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "New Title", description: "Hello", iconName: "flame.fill")
            HeaderViewRegular(title: "Another Title", description: nil, iconName: nil)
            
            // these are with @ViewBuilder for content - Closures
            HeaderViewGeneric(title: "Generic Title 1") {
                HStack {
                    Text("Hi")
                    Image(systemName: "bolt.fill")
                }
            }
            //an eg.to showcase that all the components in SwiftUI uses @ViewBuilder. This is HStack
            CustomHStack {
                Text("Hello World !")
                Image(systemName: "bolt.fill")
            }
            
            /*
             // MARK: these are without @ViewBuilder for content
             HeaderViewGeneric(title: "Generic 1", content: Text("Hello"))
             HeaderViewGeneric(title: "Generic 2", content: Image(systemName: "flame.fill"))
             HeaderViewGeneric(
             title: "Generic 3",
             content:
             HStack {
             Text("Hello")
             Image(systemName: "bolt.fill")
             }
             )
             */
            
            Spacer()
        }
    }
}

struct ViewBuilderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        //ViewBuilderBootcamp()
        LocalViewBuilder(type: .two)
    }
}

struct LocalViewBuilder: View {
    enum ViewType {
        case one, two, three
    }
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one: viewOne
        case .two: viewTwo
        case .three: viewThree
        }
        
        /*
        if type == .one {
         viewOne
        } else if type == .two {
         viewTwo
        } else if type == .three { viewThree }
         */
    }
    
    private var viewOne: some View {
        Text("One !")
    }
    private var viewTwo: some View {
        VStack {
            Text("Twooo !")
            Image(systemName: "heart.fill")
        }
    }
    private var viewThree: some View {
        Image(systemName: "bolt.fill")
    }
}
