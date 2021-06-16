//
//  CardContentView.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/12.
//

import SwiftUI


struct CardContentView: View {
    let content: Card.Content
    
    var body: some View{
        switch content.symbol {
        case .diamond:
            VStack{
                switch content.num{
                case 1: diamond()
                case 2: diamond();diamond()
                default:diamond();diamond();diamond()
                }
            }
        case .curve:
            VStack{
                switch content.num{
                case 1: curve()
                case 2: curve();curve()
                default: curve();curve();curve()
                }
            }
        default:
            VStack{
                switch content.num{
                case 1: capsule()
                case 2: capsule();capsule()
                default: capsule();capsule();capsule()
                }
            }
        }
    }
    
    @ViewBuilder
    func diamond() -> some View {
        GeometryReader{ geometry in
            ZStack{
                DiamondShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                    .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                if content.shading == .solid{
                    DiamondShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                }else if content.shading == .diagonal{
                    cover(size: geometry.size, contentScale: CardView.CardSize.contentScale, strokeLine: CardView.CardSize.shapeStrokeLineWidth)
                        .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                        .clipShape(DiamondShape(size: geometry.size, contentScale: CardView.CardSize.contentScale))
                }
            }
        }
    }

    @ViewBuilder
    func capsule() -> some View {
        GeometryReader{ geometry in
            ZStack{
                CapsuleShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                    .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                if content.shading == .solid{
                    CapsuleShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                }else if content.shading == .diagonal{
                    cover(size: geometry.size, contentScale: CardView.CardSize.contentScale, strokeLine: CardView.CardSize.shapeStrokeLineWidth)
                        .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                        .clipShape(CapsuleShape(size: geometry.size, contentScale: CardView.CardSize.contentScale))
                }
            }
        }
    }



    @ViewBuilder
    func curve() -> some View {
        GeometryReader{ geometry in
            CurveShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
                .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
            if content.shading == .solid{
                CurveShape(size: geometry.size, contentScale: CardView.CardSize.contentScale)
            }else if content.shading == .diagonal{
                cover(size: geometry.size, contentScale: CardView.CardSize.contentScale, strokeLine: CardView.CardSize.shapeStrokeLineWidth)
                    .stroke(lineWidth: CardView.CardSize.shapeStrokeLineWidth)
                    .clipShape(CurveShape(size: geometry.size, contentScale: CardView.CardSize.contentScale))
            }
        }
    }


    
    
}

