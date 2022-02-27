//
//  SortFilterMapBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 27/02/22.
//

import SwiftUI

//-> MODEL
struct UserModel: Identifiable {
    let id = UUID().uuidString
    //let name: String
    let name: String?
    let points: Int
    let isVerified: Bool
}

//-> VIEW_MODEL
class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: "Chris", points: 0, isVerified: false)
        let user3 = UserModel(name: nil, points: 20, isVerified: true)
        let user4 = UserModel(name: "Emily", points: 50, isVerified: false)
        let user5 = UserModel(name: "Samantha", points: 45, isVerified: true)
        let user6 = UserModel(name: "Jason", points: 23, isVerified: false)
        let user7 = UserModel(name: "Sarah", points: 76, isVerified: true)
        let user8 = UserModel(name: nil, points: 45, isVerified: false)
        let user9 = UserModel(name: "Steve", points: 1, isVerified: true)
        let user10 = UserModel(name: "Amanda", points: 100, isVerified: false)
        
        self.dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10
        ])
    }
    func updateFilteredArray() {
        //1-> sort
        /****
         filteredArray = dataArray.sorted { (user1, user2) -> Bool in
         return user1.points > user2.points
         }
         // sortest way to sort
         filteredArray = dataArray.sorted(by: {$0.points > $1.points})
         *********/
        
        //2-> filter
        /****
         filteredArray = dataArray.filter({ (user) -> Bool in
         //return user.points < 50
         //return user.name.contains("i")
         return user.isVerified
         })
         // sortest way for filter
         filteredArray = dataArray.filter({$0.isVerified})
         **/
        
        //3-> map
        /****
         mappedArray = dataArray.map({ (user) -> String in
         return user.name ?? "Error"
         })
         mappedArray = dataArray.map({ (user) -> String in
         return user.name
         })
         // sortest way to map
         mappedArray = dataArray.map({$0.name})
         **/
        
        //4-> compact map, when any one of the attribute is optional in model
        /****
         mappedArray = dataArray.compactMap({ (user) -> String? in
         return user.name
         })
         // sortest way to compact map
         mappedArray = dataArray.compactMap({$0.name})
         **/
        
        //5-> stacking all these 3 methods to get some complex filter.
        mappedArray = dataArray
            .sorted(by: {$0.points > $1.points})
            .filter({$0.isVerified})
            .compactMap({$0.name})
    }
}

struct SortFilterMapBootcamp: View {
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(vm.mappedArray, id: \.self) { name in
                VStack(spacing: 10) {
                    Text(name).font(.title)
                    Divider()
                }
                
                /****
                 ForEach(vm.filteredArray) { user in
                 VStack(alignment: .leading) {
                 Text(user.name).font(.headline)
                 HStack {
                 Text("Points: \(user.points)")
                 Spacer()
                 if user.isVerified {
                 Image(systemName: "flame.fill")
                 }
                 }
                 }
                 .foregroundColor(.white)
                 .padding()
                 .background(user.isVerified ? Color.green :Color.blue)
                 .cornerRadius(10)
                 .padding(.horizontal)
                 }
                 ***/
            }
        }
    }
}

struct SortFilterMapBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SortFilterMapBootcamp()
    }
}
