//
//  RuleSheet.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/15.
//

import SwiftUI


struct RuleSheet: View {
    var body: some View {
        HStack{
            ScrollView{
                Text("Rules")
                    .font(.title)
                    .padding()
                Text("""
            The object of the game is to identify a 'Set' of three cards from 12 cards laid out on the table. Each card has a variation of the following four features:

            1) COLOR: Each card is red, green, or blue.
            2) SYMBOL: Each card contains ovals, squiggles, or diamonds.
            3) NUMBER: Each card has one, two, or three symbols.
            4) SHADING: Each card is solid, open, or striped.
            """)
                    .padding()
            Text("""
            A 'Set' consists of three cards in which each feature is EITHER the same on each card OR is different on each card. That is to say, any feature in the 'Set' of three cards is either common to all three cards or is different on each card.
            """)
                    .padding()
                
            Text("For Example:")
                .font(.headline)
                .multilineTextAlignment(.leading)
                
                let card1 = Card(id: 0, isChoosing: true, isMatched: true, content: Card.Content(color: .green, symbol: .capsule, num: 2, shading: .solid))
                let card2 = Card(id: 1, isChoosing: true, isMatched: true, content: Card.Content(color: .red, symbol: .capsule, num: 2, shading: .solid))
                let card3 = Card(id: 2, isChoosing: true, isMatched: true, content: Card.Content(color: .blue, symbol: .capsule, num: 2, shading: .solid))
                
                Text("""
                    1) color: different on each card, symbol: the same on each card (oval), number: the same on each (two), shading: the same on each card (solid)
                    
                    """)
                    .padding()
                HStack{
                    CardView(card: card1, themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: card2, themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: card3, themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                }
                .padding()
                Text("""
                2) color: different on each card, symbol: different on each card, number: different on each card, shading: different on each card
                """)
                    .padding()
                let card4 = Card(id: 0, isChoosing: true, isMatched: true, content: Card.Content(color: .blue, symbol: .diamond, num: 2, shading: .diagonal))
                let card5 = Card(id: 1, isChoosing: true, isMatched: true, content: Card.Content(color: .red, symbol: .curve, num: 1, shading: .solid))
                let card6 = Card(id: 2, isChoosing: true, isMatched: true, content: Card.Content(color: .green, symbol: .capsule, num: 3, shading: .hollow))
                HStack{
                    CardView(card: card4, themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: card5, themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: card6, themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                }
                .padding()
                
                Text("""
                    3) color: the same on each card (green), symbol: the same on each card (diamond), number: different on each card, shading: different on each card
                    """).padding()
                let card7 = Card(id: 0, isChoosing: true, isMatched: true, content: Card.Content(color: .blue, symbol: .diamond, num: 2, shading: .solid))
                let card8 = Card(id: 1, isChoosing: true, isMatched: true, content: Card.Content(color: .red, symbol: .diamond, num: 3, shading: .diagonal))
                let card9 = Card(id: 2, isChoosing: true, isMatched: true, content: Card.Content(color: .green, symbol: .diamond, num: 1, shading: .hollow))
                HStack{
                    CardView(card: card7, themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: card8, themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: card9, themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                }
                .padding()
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct RuleSheet_Previews: PreviewProvider {
    static var previews: some View {
        RuleSheet()
    }
}
