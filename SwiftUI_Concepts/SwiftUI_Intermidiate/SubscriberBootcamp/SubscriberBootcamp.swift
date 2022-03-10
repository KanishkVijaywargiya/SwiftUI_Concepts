//
//  SubscriberBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 09/03/22.
//

import SwiftUI

struct SubscriberBootcamp: View {
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)").font(.largeTitle)
            
            Text(vm.textIsValid.description)
                .bold()
                .foregroundColor(vm.textIsValid ? .blue : .red)
            
            TextField("Type something here...", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .cornerRadius(10)
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0 :
                                    vm.textIsValid ? 0 : 1)
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(vm.textIsValid ? 1 : 0)
                    }
                        .font(.title)
                        .padding(.trailing)
                    , alignment: .trailing
                )
            
            Button(action: {}) {
                Text("submit".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1 : 0.5)
            }.disabled(!vm.showButton)
        }
        .padding()
    }
}

struct SubscriberBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberBootcamp()
    }
}
