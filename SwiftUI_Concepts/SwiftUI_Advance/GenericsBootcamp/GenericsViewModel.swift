//
//  GenericsViewModel.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 04/05/22.
//

import Foundation
import SwiftUI

class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello World !")
    @Published var boolModel = BoolModel(info: true)
    @Published var genericStringModel = GenericModel(info: "Hello World!")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        withAnimation(.easeInOut) {
            stringModel = stringModel.removeInfo()
            boolModel = boolModel.removeInfo()
            genericStringModel = genericStringModel.removeInfo()
            genericBoolModel = genericBoolModel.removeInfo()}
    }
    
    //@Published var dataArray: [String] = []
    //@Published var dataArray: [Bool] = []
    
    /*
     init() {
     //dataArray = ["One", "Two", "Three"]
     //dataArray = [true, false, true]
     }
     */
    /*
     func removeDataFromDataArray() {
     withAnimation(.easeInOut) {
     dataArray.removeAll()
     dataArray.append("Apple")
     }
     }
     */
}

