//
//  CoreDataBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 02/03/22.
//

import SwiftUI

struct CoreDataBootcamp: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    @State var sheetView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextFieldView
                AddButton
                ListView
            }
            .navigationTitle("Fruits")
        }
    }
}

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
    }
}

extension CoreDataBootcamp {
    private var TextFieldView: some View {
        TextField("Add fruit here...", text: $textFieldText)
            .font(.headline)
            .foregroundColor(.black)
            .padding(.leading)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
            .cornerRadius(10)
            .padding(.horizontal)
    }
    private var AddButton: some View {
        Button(action: {
            guard !textFieldText.isEmpty else { return }
            vm.addFruits(text: textFieldText)
            textFieldText = ""
        }) {
            Text("Add")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color(#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
    private var ListView: some View {
        List {
            ForEach(vm.savedEntities) { item in
                Text(item.name ?? "No Name")
                    .onTapGesture {
                        vm.updateFruit(entity: item)
                    }
            }
            .onDelete(perform: vm.DeleteFruit)
        }.listStyle(PlainListStyle())
    }
}

// View - UI
// Model - data point
// ViewModel - manages data for a view
