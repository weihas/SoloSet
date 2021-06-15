//
//  CardContentView.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/12.
//

import SwiftUI


struct CardContentView: View {
    let card: Card

    var body: some View{
        
        if card.content.symbol == .diamond {
            diamond()
        }else if card.content.symbol == .curve {
            curve()
        }else if card.content.symbol == .capsule {
            capsule()
        }
    }
    
    
    func diamond() -> some View {
        VStack{
            ForEach(0..<card.content.num){index in
                GeometryReader{ geometry in
                    ZStack{
                        DiamondShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                            .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                        if card.content.shading == .solid{
                            DiamondShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                        }else if card.content.shading == .diagonal{
                            cover(size: geometry.size, contentScale: CardView.CardSize.contentScale, strokeLine: CardView.CardSize.shapeStrokeLineWidth)
                                .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                                .clipShape(DiamondShape(size: geometry.size, contentScale: CardView.CardSize.contentScale))
                        }
                    }
                }
            }
        }
    }
    
    
    func capsule() -> some View {
        VStack{
            ForEach(0..<card.content.num){index in
                GeometryReader{ geometry in
                    ZStack{
                        CapsuleShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                            .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                        if card.content.shading == .solid{
                            CapsuleShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                        }else if card.content.shading == .diagonal{
                            cover(size: geometry.size, contentScale: CardView.CardSize.contentScale, strokeLine: CardView.CardSize.shapeStrokeLineWidth)
                                .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                                .clipShape(CapsuleShape(size: geometry.size, contentScale: CardView.CardSize.contentScale))
                        }
                    }
                }
            }
        }
        
    }
    
    
    
    func curve() -> some View {
        VStack{
            ForEach(0..<card.content.num){index in
                GeometryReader{ geometry in
                    CurveShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                        .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                    if card.content.shading == .solid{
                        CurveShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                    }else if card.content.shading == .diagonal{
                        cover(size: geometry.size, contentScale: CardView.CardSize.contentScale, strokeLine: CardView.CardSize.shapeStrokeLineWidth)
                            .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                            .clipShape(CurveShape(size: geometry.size, contentScale: CardView.CardSize.contentScale))
                    }
                }
            }
        }
    }
    
    
    
    
}

