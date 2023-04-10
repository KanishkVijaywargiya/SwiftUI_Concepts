//
//  DonutChart.swift
//  SwiftUI_Concepts
//
//  Created by Kanishk Vijaywargiya on 10/04/23.
//

import SwiftUI

let data = [
    (2.0, Color(.red)),
    (3.0, Color(.orange)),
    (4.0, Color(.yellow)),
    (1.0, Color(.green)),
    (5.0, Color(.blue)),
    (4.0, Color(.brown)),
    (2.0, Color(.purple))
]

struct DonutChart: View {
    @State var slices: [(Double, Color)]
    
    var body: some View {
        Canvas { context, size in
            //Start Donut
            let donut = Path { p in
                p.addEllipse(in: CGRect(origin: .zero, size: size))
                p.addEllipse(in: CGRect(x: size.width * 0.25, y: size.height * 0.25, width: size.width * 0.5, height: size.height * 0.5))
            }
            
            context.clip(to: donut, style: .init(eoFill: true))
            
            //End Donut
            let total = slices.reduce(0) { $0 + $1.0 }
            context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
            
            var pieContext = context
            pieContext.rotate(by: .degrees(-90))
            let radius = min(size.width, size.height) * 0.48
            let gapSize = Angle(degrees: 5) // size of the gap between slices in degrees
            
            var startAngle = Angle.zero
            
            for (value, color) in slices {
                let angle = Angle(degrees: 360 * (value / total))
                let endAngle = startAngle + angle
                let path = Path { p in
                    p.move(to: .zero)
                    p.addArc(center: .zero, radius: radius, startAngle: startAngle + Angle(degrees: 5) / 2, endAngle: endAngle, clockwise: false)
                    p.closeSubpath()
                }
                pieContext.fill(path, with: .color(color))
                startAngle = endAngle
            }
        }.aspectRatio(1, contentMode: .fit)
    }
}

struct DonutChart_Previews: PreviewProvider {
    static var previews: some View {
        DonutChart(slices: data)
    }
}
