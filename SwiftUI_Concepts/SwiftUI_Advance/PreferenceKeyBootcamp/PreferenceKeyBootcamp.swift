//
//  PreferenceKeyBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 20/05/22.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    @State var text: String = "Hello World !!"
    
    var body: some View {
        NavigationView {
            VStack {
                //Text(text)
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation Title")
                //.customTitle("New Values !!!") // custom func created inside an extension
                //.preference(key: CustomTitlePreferenceKey.self, value: "New Value")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
    }
}

extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct PreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootcamp()
    }
}

struct SecondaryScreen: View {
    let text: String
    @State private var newValue: String = ""
    @State private var isLoading: Bool = false
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            } else {
                Text(text)
                    .customTitle(newValue)
            }
        }
        .onAppear(perform: getDataFromDatabase)
    }
    
    func getDataFromDatabase() {
        // download
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            isLoading = false
            self.newValue = "New value from database"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
