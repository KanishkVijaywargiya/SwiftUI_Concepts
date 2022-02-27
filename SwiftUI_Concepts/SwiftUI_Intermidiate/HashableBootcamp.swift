//
//  HashableBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 27/02/22.
//

import SwiftUI

//struct MyCustomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}
struct MyCustomModel: Hashable {
    let title: String
    let subTitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subTitle)
    }
}

struct HashableBootcamp: View {
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE", subTitle: "1"),
        MyCustomModel(title: "SECOND", subTitle: "2"),
        MyCustomModel(title: "THREE", subTitle: "3"),
        MyCustomModel(title: "FOUR", subTitle: "4"),
        MyCustomModel(title: "FIVE", subTitle: "5")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // with Hashable
                ForEach(data, id: \.self) {
                    Text($0.title).font(.headline)
                    Text($0.hashValue.description).font(.footnote.bold())
                    Divider()
                }
                // with identifiable
//                ForEach(data) {
//                    Text($0.title).font(.headline)
//                    Text($0.id).font(.footnote.bold())
//                    Divider()
//                }
                // normal without identifiable
//                ForEach(data, id: \.self) {
//                    Text($0).font(.headline)
//                    Text($0.hashValue.description).font(.footnote.bold())
//                    Divider()
//                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}


// For some reason we don't want ID to be used by any other developer, we use hashable instead of Identifiable. We can also combine multiple variable & make our own hashable
