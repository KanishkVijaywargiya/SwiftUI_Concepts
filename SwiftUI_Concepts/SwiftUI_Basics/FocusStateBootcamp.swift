//
//  FocusStateBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 16/02/22.
//

import SwiftUI

struct FocusStateBootcamp: View {
    enum onboardingFields {
        case username
        case password
    }
    @State private var username: String = ""
//    @FocusState private var usernameInFocus: Bool
    @State private var password: String = ""
//    @FocusState private var passwordInFocus: Bool
    @FocusState private var fieldsInFocus: onboardingFields?
    
    var body: some View {
        VStack {
            TextField("Add your name here...", text: $username)
                .focused($fieldsInFocus, equals: .username)
//                .focused($usernameInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            SecureField("Add your name here...", text: $password)
                .focused($fieldsInFocus, equals: .password)
//                .focused($passwordInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button(action: {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                if usernameIsValid && passwordIsValid {
                    print("Sign up")
                } else if usernameIsValid {
                    fieldsInFocus = .password
//                    usernameInFocus = false
//                    passwordInFocus = true
                } else if passwordIsValid {
                    fieldsInFocus = .username
//                    usernameInFocus = true
//                    passwordInFocus = false
                }
            }) {
                Text("Sign up")
            }
            
//            Button(action: {usernameInFocus.toggle()}) {
//                Text("TOOGLE FOCUS STATE")
//            }
        }
        .padding(40)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.usernameInFocus = true
//            }
//        }
    }
}

struct FocusStateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootcamp()
    }
}
