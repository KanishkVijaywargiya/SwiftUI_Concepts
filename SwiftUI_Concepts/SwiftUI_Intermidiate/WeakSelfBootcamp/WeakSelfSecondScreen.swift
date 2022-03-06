//
//  WeakSelfSecondScreen.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 06/03/22.
//

import SwiftUI

struct WeakSelfSecondScreen: View {
    @StateObject var vm = WeakSelfViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
        
    }
}

struct WeakSelfSecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfSecondScreen()
    }
}
