//
//  AppStorageBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 17/02/22.
//

import SwiftUI

struct AppStorageBootcamp: View {
    @AppStorage("name") var currentUserName: String?
//    @State var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here")
//            or
//            if let name = currentUserName {
//                Text(name)
//            }
            
            Button(action: {
                let name = "Emilly"
                currentUserName = name
//                UserDefaults.standard.set(name, forKey: "name")
            }) {
                Text("Save".uppercased())
            }
        }
//        .onAppear {
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}

// this screen contains both eg. of UserDefaults & AppStorage
// AppStorage is a SwiftUI version of UserDefaults.

