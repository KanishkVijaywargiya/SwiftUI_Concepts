//
//  CustomShapesBootcamp.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 28/04/22.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY)) //move basically the cursor around anywhere inside the frame but it won't draw a line as it moves to that, so it's kind of moving a cursor
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) //addline is going to find a point & draw a line from the current point to that next point.
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path {path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midY, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
        }
    }
}

struct CustomShapesBootcamp: View {
    var body: some View {
        ZStack {
            Trapezoid()
                .frame(width: 300, height: 100)
            /*
            Diamond()
                .frame(width: 300, height: 300)
             */
            
            /*
            Image("img2")
                .resizable()
                .scaledToFit()
                .clipShape(
                    Triangle()
                        .rotation(Angle(degrees: 180))
                )
             */
            
            /*
            Triangle()
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [10]))
                .foregroundColor(.orange)
                .trim(from: 0, to: 0.5)
                //.fill(Color.green)
                .frame(width: 300, height: 300)
             */
        }
    }
}

struct CustomShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapesBootcamp()
    }
}
