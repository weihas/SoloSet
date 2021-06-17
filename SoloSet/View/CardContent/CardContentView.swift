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
            let strokeline = geometry.size.width * ShapeSize.strokeLineScale
            ZStack{
                DiamondShape(size: geometry.size, contentScale: ShapeSize.contentScale)
                    .stroke(lineWidth: strokeline)
                if content.shading == .solid{
                    DiamondShape(size: geometry.size, contentScale: ShapeSize.contentScale)
                }else if content.shading == .diagonal{
                    cover(size: geometry.size, contentScale: ShapeSize.contentScale, strokeLine: strokeline)
                        .stroke(lineWidth: strokeline)
                        .clipShape(DiamondShape(size: geometry.size, contentScale: ShapeSize.contentScale))
                }
            }
        }
    }

    @ViewBuilder
    func capsule() -> some View {
        GeometryReader{ geometry in
            let strokeline = geometry.size.width * ShapeSize.strokeLineScale
            ZStack{
                CapsuleShape(size: geometry.size, contentScale: ShapeSize.contentScale)
                    .stroke(lineWidth: strokeline)
                if content.shading == .solid{
                    CapsuleShape(size: geometry.size, contentScale: ShapeSize.contentScale)
                }else if content.shading == .diagonal{
                    cover(size: geometry.size, contentScale: ShapeSize.contentScale, strokeLine: strokeline)
                        .stroke(lineWidth: strokeline)
                        .clipShape(CapsuleShape(size: geometry.size, contentScale: ShapeSize.contentScale))
                }
            }
        }
    }



    @ViewBuilder
    func curve() -> some View {
        GeometryReader{ geometry in
            let strokeline = geometry.size.width * ShapeSize.strokeLineScale
            CurveShape(size: geometry.size, contentScale: ShapeSize.contentScale)
                .stroke(lineWidth: strokeline)
            if content.shading == .solid{
                CurveShape(size: geometry.size, contentScale: ShapeSize.contentScale)
            }else if content.shading == .diagonal{
                cover(size: geometry.size, contentScale: ShapeSize.contentScale, strokeLine: strokeline)
                    .stroke(lineWidth: strokeline)
                    .clipShape(CurveShape(size: geometry.size, contentScale: ShapeSize.contentScale))
            }
        }
    }


    struct ShapeSize{
        static var contentScale: CGFloat = 0.6
        static var strokeLineScale: CGFloat = 1/35
    }
    
}

