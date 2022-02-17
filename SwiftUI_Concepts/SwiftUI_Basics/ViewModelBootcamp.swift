//
//  ViewModelBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 16/02/22.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Mango", count: 2)
        let fruit3 = FruitModel(name: "Banana", count: 5)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            
            self.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct ViewModelBootcamp: View {
    //    @State var fruitArray: [FruitModel] = []
    //    @ObservedObject var fruitVM: FruitViewModel = FruitViewModel()
    @StateObject var fruitVM: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if fruitVM.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitVM.fruitArray) { fruit in
                        NavigationLink(destination: ThirdScreen(fruit: fruit)) {
                            HStack {
                                Text("\(fruit.count)")
                                    .foregroundColor(.red)
                                Text(fruit.name)
                                    .font(.headline.bold())
                            }
                        }
                    }
                    .onDelete(perform: fruitVM.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: SecondScreen(fruitVM: fruitVM)) {
                        Image(systemName: "flame.fill")
                            .font(.title)
                            .foregroundColor(.black)
                    }
            )
        }
    }
}

struct SecondScreen: View {
    @ObservedObject var fruitVM: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                ForEach(fruitVM.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.primary)
                        .font(.headline)
                        .frame(width: 300, height: 150)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding()
                        .shadow(radius: 10)
                }
            }
        }
    }
}

struct ThirdScreen: View {
    let fruit: FruitModel
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 2) {
                Text("name: \(fruit.name)")
                    .foregroundColor(.primary)
                    .font(.headline)
                
                Text("count: \(fruit.count)")
                    .foregroundColor(.red)
                    .font(.caption.bold())
            }
            .frame(width: 300, height: 150)
            .background(Color.white)
            .cornerRadius(25)
            .padding()
            .shadow(radius: 10)
        }
    }
}


struct ViewModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelBootcamp()
        //                SecondScreen(fruitVM: FruitViewModel())
    }
}

// @StateObject -> Use this on creation or init()
// @ObservedObject -> Use this SubViews, when we are passing data to second screen.
