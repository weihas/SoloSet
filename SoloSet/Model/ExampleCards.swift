//
//  ExampleCards.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/17.
//

import SwiftUI

struct ExampleCards{
    var exampleCards: [Card]
    

    
    init() {
        let exampleColor: [Color] = [.blue,.red,.green]
        let exampleSymbol: [ModelEnum.Symbol] = [.capsule,.capsule,.capsule,.diamond,.curve,.capsule,.diamond,.diamond,.diamond]
        let exampleShading: [ModelEnum.Shading] = [.solid,.solid,.solid,.diagonal,.solid,.hollow,.solid,.diagonal,.hollow]
        
        exampleCards = []
        for index in 0...8 {
            let color = exampleColor[index%3]
            let symbol = exampleSymbol[index]
            let shading = exampleShading[index]
            
            let content = Card.Content(color: color, symbol: symbol, num: index, shading: shading)
            exampleCards.append(Card(id: index, content: content))
        }
        
    }
}
