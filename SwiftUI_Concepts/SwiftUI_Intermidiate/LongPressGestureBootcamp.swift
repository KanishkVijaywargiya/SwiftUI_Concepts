//
//  LongPressGestureBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 22/02/22.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    @State var count: CGFloat = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.red)
                .frame(maxWidth: isComplete ? count : 0)
                .frame(height: 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black)
                .cornerRadius(50)
                .padding()
            
            HStack {
                Text("Click here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50, pressing: { (isPressing) in
                        // start of press -> min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1)) {
                                isComplete = true
                                count += 30
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                        count = 0
                                    }
                                }
                            }
                        }
                    }, perform: {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                            count = UIScreen.main.bounds.width
                        }
                    })
                
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isComplete = false
                            isSuccess = false
                            count = 0
                        }
                    }
            }
        }
        
        
        //        Text(isComplete ? "Completed" : "Not Completed")
        //            .padding()
        //            .padding(.horizontal)
        //            .background(isComplete ? Color.green :  Color.gray)
        //            .cornerRadius(10)
        //            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
        //                isComplete.toggle()
        //            }
        //            .onLongPressGesture {
        //                isComplete.toggle()
        //            }
        //            .onTapGesture {
        //                isComplete.toggle()
        //            }
    }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
