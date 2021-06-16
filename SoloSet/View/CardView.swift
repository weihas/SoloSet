//
//  CardView.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/12.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let themeColor: Color
    
    
    var body: some View{
        ZStack{
            CardContentView(content: card.content)
                .foregroundColor(card.content.color)
            if card.isChoosing{
                RoundedRectangle(cornerRadius: CardSize.cardCornerRadius)
                    .stroke(lineWidth: CardSize.cardStrokeLineWidth+3)
                    .shadow(radius: 3, x: 1, y: 1)
            }else if card.isTipping{
                RoundedRectangle(cornerRadius: CardSize.cardCornerRadius)
                    .stroke(lineWidth: CardSize.cardStrokeLineWidth+3)
                    .shadow(radius: 3, x: 1, y: 1)
                    .foregroundColor(.green)
            }else{
                RoundedRectangle(cornerRadius: CardSize.cardCornerRadius)
                    .stroke(lineWidth: CardSize.cardStrokeLineWidth)
                    .shadow(radius: 3, x: 1, y: 1)
            }
        }
        .foregroundColor(themeColor)

    }
    
    
    struct CardSize{
        static let cardCornerRadius: CGFloat = 15.0
        static let cardStrokeLineWidth: CGFloat = 2.0
        static let shapeStrokeLineWidth: CGFloat = 2.0
        static var contentScale: CGFloat = 0.6
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card1 = Card(id: 0, content: Card.Content(color: .red, symbol: .diamond, num: 3, shading: .solid))
        let card2 = Card(id: 1, content: Card.Content(color: .green, symbol: .capsule, num: 3, shading: .solid))
        let card3 = Card(id: 2, content: Card.Content(color: .blue, symbol: .curve, num: 3, shading: .solid))
        let card4 = Card(id: 3, content: Card.Content(color: .red, symbol: .diamond, num: 2, shading: .hollow))
        let card5 = Card(id: 4, content: Card.Content(color: .green, symbol: .capsule, num: 2, shading: .hollow))
        let card6 = Card(id: 5, content: Card.Content(color: .blue, symbol: .curve, num: 2, shading: .hollow))
        let card7 = Card(id: 6, content: Card.Content(color: .red, symbol: .diamond, num: 1, shading: .diagonal))
        let card8 = Card(id: 7, content: Card.Content(color: .green, symbol: .capsule, num: 1, shading: .diagonal))
        let card9 = Card(id: 8, content: Card.Content(color: .blue, symbol: .curve, num: 1, shading: .diagonal))
        VStack{
            HStack{
                CardView(card: card1, themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
                CardView(card: card2, themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
                CardView(card: card3, themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
            }
            HStack{
                CardView(card: card4, themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
                CardView(card: card5, themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
                CardView(card: card6, themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
            }
            HStack{
                CardView(card: card7, themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
                CardView(card: card8, themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
                CardView(card: card9, themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}
