//
//  MultipleSheetsBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 26/02/22.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1-> BINDING
// 2-> use multiple sheets
// 3-> use item approach

struct MultipleSheetsBootcamp: View {
//    @State var selectedModel: RandomModel = RandomModel(title: "STARTING TITLE") //-> 1
    @State var selectedModel: RandomModel? = nil //-> 3
//    @State var showSheet: Bool = false //-> 1, 2
//    @State var showSheet2: Bool = false //-> 2
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                selectedModel = RandomModel(title: "ONE") //-> 1, 3
//                showSheet.toggle() //-> 1, 2
            }) {
                Text("Button 1")
            }
            Button(action: {
                selectedModel = RandomModel(title: "TWO") //-> 1, 3
//                showSheet.toggle() //-> 1
//                showSheet2.toggle() //-> 2
            }) {
                Text("Button 2")
            }
//            .sheet(isPresented: $showSheet2) { //-> 2
//                NextScreen(selectedModel: RandomModel(title: "TWO"))
//            }
        }
        .sheet(item: $selectedModel) { item in //-> 3
            NextScreen(selectedModel: item)
        }
//        .sheet(isPresented: $showSheet) { //-> 1
//            NextScreen(selectedModel: $selectedModel)
//        }
//        .sheet(isPresented: $showSheet) { //-> 2
//            NextScreen(selectedModel: RandomModel(title: "ONE"))
//        }
    }
}

struct NextScreen: View {
//    @Binding var selectedModel: RandomModel //-> 1
    let selectedModel: RandomModel //-> 2, 3
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
