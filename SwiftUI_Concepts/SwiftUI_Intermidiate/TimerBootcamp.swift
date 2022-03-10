//
//  TimerBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 08/03/22.
//

import SwiftUI

struct TimerBootcamp: View {
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    /// CURRENT TIME
    /***
     @State var currentDate: Date = Date()
     var dateFormatter: DateFormatter {
     let formatter = DateFormatter()
     //formatter.dateStyle = .medium
     //formatter.timeStyle = .full
     formatter.timeStyle = .medium
     return formatter
     }
     */
    
    /// COUNT DOWN
    /***
     @State var count: Int = 10
     @State var finishedText: String? = nil
     */
    
    /// Countdown To Date
    /**
     @State var timeRemaining: String = ""
     let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
     func updateTimeRemaining() {
     let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
     let hour = remaining.hour ?? 0
     let minute = remaining.minute ?? 0
     let second = remaining.second ?? 0
     timeRemaining = "\(hour) hr:\(minute) min:\(second) sec"
     //timeRemaining = "\(hour):\(minute):\(second)"
     }
     */
    
    /// Animation Counter
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [
                    Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
                ]),
                center: .center,
                startRadius: 5,
                endRadius: 500).ignoresSafeArea()
            
            TabView(selection: $count) {
                Rectangle().tag(1).foregroundColor(.red)
                Rectangle().tag(2).foregroundColor(.blue)
                Rectangle().tag(3).foregroundColor(.green)
                Rectangle().tag(4).foregroundColor(.orange)
                Rectangle().tag(5).foregroundColor(.yellow)
            }
            .frame(height: 500)
            .tabViewStyle(PageTabViewStyle())
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
            
            // animation circular loader
            //HStack(spacing: 15) {
            //  Circle().offset(y: count == 1 ? -20 : 0)
            //Circle().offset(y: count == 2 ? -20 : 0)
            //Circle().offset(y: count == 3 ? -20 : 0)
            //}
            //.frame(width: 150)
            //.foregroundColor(.white)
            
            //Text(currentDate.description)
            //Text(dateFormatter.string(from: currentDate))
            //Text(finishedText ?? "\(count)")
            //Text(timeRemaining)
            //.font(.system(size: 100, weight: .semibold, design: .rounded))
            //.foregroundColor(.white)
            //.lineLimit(1)
            //.minimumScaleFactor(0.1)
        }
        .onReceive(timer) { value in
            withAnimation(.default) {
                count = count == 5 ? 0 : count + 1
                //count = count == 3 ? 0 : count + 1 // this is for circle animation
            }
        }
        //.onReceive(timer) { _ in
        //  updateTimeRemaining()
        //}
        //        .onReceive(timer, perform: { _ in
        //            if count <= 1 {
        //                finishedText = "Wow!"
        //            } else {
        //                count -= 1
        //            }
        //        })
        //.onReceive(timer) { value in
        //  currentDate = value
        //}
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}

/****
 Use case from this screen
 1]. we can use timer to use as a timer for dates n all...
 2]. we can make an animating circular loader using timer publisher
 3]. we can make an automatic carousel using Tab view & timer publisher.
 */
