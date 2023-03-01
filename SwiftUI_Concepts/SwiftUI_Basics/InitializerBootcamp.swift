//
//  InitializerBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 09/02/22.
//

import SwiftUI

struct InitializerBootcamp: View {
    let backgroundColor: Color
    let count: Int
    let title: String   
    
    init(fruit: Fruits) {
        if fruit == .apple {
            self.title = "Apples"
            self.count = 50
            self.backgroundColor = .red
        } else {
            self.title = "Oranges"
            self.count = 100
            self.backgroundColor = .orange
        }
    }
    
    enum Fruits {
        case apple
        case orange
    }
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct InitializerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InitializerBootcamp(fruit: .apple)
            InitializerBootcamp(fruit: .orange)
        }
    }
}

// what is init() ?
// an initializer is basically a func that runs to setup our views. So we can customize these init() func with our own custom variables.
// eg: if we want to use the same view a bunch of time in our app & each time we wanted to may be change the background color, well we could add a custom color to our init, so every time we call this view. We just have to change the color & have the same view with a different color, so one time red, second time green...


// what is enums ?
// stands for enumerations & it is an easy way in our code to categorize the certain things.
// eg: if we had an app where may be it is a map app & always refering a direction like North, South, East, West. Well a beginner coder will just type a string for these, but a good coder would use an enum & create a 4 cases on this enum for N S E W. So every time in our code instead of having to type it all, we can just refrence it using enum.
// makes app more streamlined, typo free & more efficient.
