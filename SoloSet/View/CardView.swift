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
        GeometryReader{ geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: geometry.size.width*1/4)
                CardContentView(content: card.content)
                    .foregroundColor(card.content.color)
                if card.isChoosing{
                    shape.stroke(lineWidth: geometry.size.width*1/10)
                        .shadow(radius: 3, x: 1, y: 1)
                }else if card.isTipping{
                    shape.stroke(lineWidth: geometry.size.width*1/10)
                        .shadow(radius: 3, x: 1, y: 1)
                        .foregroundColor(.green)
                }else{
                    shape.stroke(lineWidth: geometry.size.width*1/20)
                        .shadow(radius: 3, x: 1, y: 1)
                }
            }
            .foregroundColor(themeColor)
            
        }
    }
    

}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let cards = ExampleCards().exampleCards
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], content: {
            ForEach(cards.indices){ index in
                CardView(card: cards[index], themeColor: .orange)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        })
    }
}
