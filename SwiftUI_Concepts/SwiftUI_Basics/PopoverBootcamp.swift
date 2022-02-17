//
//  PopoverBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 14/02/22.
//

import SwiftUI

struct PopoverBootcamp: View {
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Button(action: {
                    withAnimation(.spring()) {
                        showNewScreen.toggle()
                    }
                }) {
                    Text("Press me")
                }
                .font(.largeTitle.bold())
                .foregroundColor(.black)
                
                Spacer()
            }
            // method - 3 - Animation Offset
            //            NewScreen(showNewScreen: $showNewScreen)
            //                .padding(.top, 100)
            //                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
            //                .animation(.spring())
            
            // method - 2 - Transition
            //            ZStack {
            //                if showNewScreen {
            //                    NewScreen(showNewScreen: $showNewScreen)
            //                        .padding(.top, 100)
            //                        .transition(.move(edge: .bottom))
            //                    //                    .animation(.spring(), value: showNewScreen)
            //                }
            //            }.zIndex(2.0)
        }
        // method - 1 - sheet
        .sheet(isPresented: $showNewScreen) {
            NewScreen()
        }
    }
}

struct NewScreen: View {
    @Environment(\.dismiss) var dismiss
//    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple.ignoresSafeArea()
            Button(action: {
                dismiss()
                //                showNewScreen.toggle()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
        }
    }
}

struct PopoverBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PopoverBootcamp()
    }
}
