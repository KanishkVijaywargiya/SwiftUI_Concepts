//
//  GenericsBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 04/05/22.
//

import SwiftUI

//generics confirming to protocol view
struct GenericView<T: View>: View {
    let content: T
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
}

struct GenericsBootcamp: View {
    @StateObject private var vm = GenericsViewModel()
    var body: some View {
        VStack {
            GenericView(content: Text("custom content"), title: "New View!")
            //GenericView(title: "New view!")
            
            Text(vm.stringModel.info ?? "No Data")
            Text(vm.boolModel.info?.description ?? "No Data")
            Text(vm.genericStringModel.info?.description ?? "No Data")
            Text(vm.genericBoolModel.info?.description ?? "No Data")
            /*
             ForEach(vm.dataArray, id: \.self) { item in
             Text(item.description)
             .onTapGesture {
             vm.removeDataFromDataArray()
             }
             }
             */
        }
        .onTapGesture {vm.removeData()}
    }
}

struct GenericsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootcamp()
    }
}

// Generics are used for cutom swiftui components, custom viewBuilders
