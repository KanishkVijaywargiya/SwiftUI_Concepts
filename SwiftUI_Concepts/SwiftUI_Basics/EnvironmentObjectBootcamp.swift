//
//  EnvironmentObjectBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 17/02/22.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple watch", "Macbook"])
    }
}

struct EnvironmentObjectBootcamp: View {
    @StateObject var vm: EnvironmentViewModel = EnvironmentViewModel() // we r creating a new Env..ViewModel here by initializing
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray, id: \.self) { item in
                    NavigationLink(destination: DetailView(selectedItem: item)) {
                        Text(item)
                    }
                }
            }
            .navigationTitle("Apple Devices")
        }
        .environmentObject(vm)
    }
}

struct DetailView: View {
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            NavigationLink(destination: FinalView()) {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(radius: 10)
            }
        }
    }
}
struct FinalView: View {
    @EnvironmentObject var vm: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))]
                ),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(vm.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectBootcamp().environmentObject(EnvironmentViewModel())
    }
}

// highlight***
// use EnvironmentObject with only those ViewModel's which are going to be used repeatedly in app !!!
