//
//  diamond.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/11.
//

import SwiftUI

struct DiamondShape: Shape {
    let size: CGSize
    let contentScale: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)

        let width = contentScale*3/5*size.width
        let height = width*1/3
        
        let up = CGPoint(x: center.x , y: center.y - height)
        let left = CGPoint(x: center.x - width , y: center.y)
        let down = CGPoint(x: center.x , y: center.y + height)
        let right = CGPoint(x: center.x + width , y: center.y)
        
        var p = Path()
        p.move(to: up)
        p.addLine(to: left)
        p.addLine(to: down)
        p.addLine(to: right)
        p.addLine(to: up)
        return p
    }
    
}

struct CapsuleShape: Shape {
    let size: CGSize
    let contentScale: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)

        let width = contentScale*2/5*size.width
        let height = width*1/2
        
        let A = CGPoint(x: center.x - width , y: center.y - height)
        let C = CGPoint(x: center.x + width , y: center.y + height)
        
        var p = Path()
        p.move(to: A)
        p.addArc(
            center: CGPoint(x: center.x - width, y: center.y),
            radius: height,
            startAngle: Angle(degrees: 270),
            endAngle: Angle(degrees: 90),
            clockwise: true)
        p.addLine(to: C)
        p.addArc(
            center: CGPoint(x: center.x + width, y: center.y),
            radius: height,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 270),
            clockwise: true)
        p.addLine(to: A)
        return p
    }
    
}


struct CurveShape: Shape {
    let size: CGSize
    let contentScale: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let width = contentScale*3/5*size.width
        let height = width*2/5
        
        let start = CGPoint(x: center.x - width , y: center.y + 2/3*height)
        let end = CGPoint(x: center.x + width , y: center.y - 2/3*height)
        
        let control1 = CGPoint(x: center.x - 2/3*width, y: center.y - 7/2*height)
        let control2 = CGPoint(x: center.x + 2/3*width, y: center.y + 3/2*height)
        let control3 = CGPoint(x: center.x + 2/3*width, y: center.y + 7/2*height)
        let control4 = CGPoint(x: center.x - 2/3*width, y: center.y - 3/2*height)
        var p = Path()
        p.move(to: start)
        p.addCurve(to: end, control1: control1, control2: control2)
        p.addCurve(to: start, control1: control3, control2: control4)
        return p
    }
    
}


struct cover: Shape {
    let size: CGSize
    let contentScale: CGFloat
    let strokeLine: CGFloat
    func path(in rect: CGRect) -> Path {
        var p = Path()
        var start = CGPoint(x: rect.minX, y: rect.minY)
        var end = CGPoint(x: rect.minX, y: rect.maxY)
        while start.x < rect.maxX {
            p.move(to: start)
            p.addLine(to: end)
            start.x += 3*strokeLine
            end.x += 3*strokeLine
        }
        return p
    }
}

