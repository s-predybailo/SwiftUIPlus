//
//  SwiftUIView 2.swift
//  
//
//  Created by Семен Предыбайло on 28.11.2023.
//

import SwiftUI

struct StarView: View {
    var cornerRadius: CGFloat
    var fillPercent: Double { // от 0.0 до 1.0
        didSet {
            fillPercent = min(max(fillPercent, 0.0), 1.0)
        }
    }
    var body: some View {
        GeometryReader { geometry in
            path(in: geometry.frame(in: .local))
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let r = rect.width / 2
        let rc = cornerRadius
        let rn = r * 0.95 - rc
        
        var cangle = -18.0
        for i in 1 ... 5 {
            let cc = CGPoint(x: center.x + rn * CGFloat(cos(Angle(degrees: cangle).radians)), y: center.y + rn * CGFloat(sin(Angle(degrees: cangle).radians)))

            let p = CGPoint(x: cc.x + rc * CGFloat(cos(Angle(degrees: cangle - 72).radians)), y: cc.y + rc * CGFloat(sin(Angle(degrees: (cangle - 72)).radians)))

            if i == 1 {
                path.move(to: p)
            } else {
                path.addLine(to: p)
            }

            path.addArc(center: cc, radius: rc, startAngle: Angle(degrees: cangle - 72), endAngle: Angle(degrees: cangle + 72), clockwise: false)
            cangle += 144
        }

        return path
    }
}

#Preview {
    StarView(cornerRadius: 1, fillPercent: 0.8)
}
