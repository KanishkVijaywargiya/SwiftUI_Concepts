//
//  ListBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 14/02/22.
//

import SwiftUI

struct ListBootcamp: View {
    @State var fruits: [String] = [
        "apple", "banana", "mango", "orange"
    ]
    @State var veggies: [String] = [
        "tomato", "potato", "beans", "carrot"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(
                    header:
                        HStack {
                            Text("Fruits")
                            Image(systemName: "flame.fill")
                        }
                ) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    //                .onDelete(perform: {index in
                    //                    delete(indexSet: index)
                    //                })
                }
                Section(header: Text("Veggies")) {
                    ForEach(veggies, id: \.self) { veggies in
                        Text(veggies.capitalized)
                    }
                }
            }
            .accentColor(.green)
            //            .listStyle(listStyle)
            .navigationTitle("Grocery List")
            .navigationBarItems(
                leading: EditButton(),
                trailing: addButton
            )
        }
        .accentColor(.pink)
    }
    
    var addButton: some View {
        Button(action: {add()}, label: {
            Text("Add")
        })
    }
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    func move(indexSet: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indexSet, toOffset: newOffset)
    }
    func add() {
        fruits.append("Cocunut")
    }
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
