//
//  CardLogic.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/11.
//

import SwiftUI

struct CardLogic {
    typealias Shading = ModelEnum.Shading
    typealias Symbol = ModelEnum.Symbol
    private(set) var deck: Array<Card>
    private(set) var tableTop: Array<Card>
    private(set) var cemetery: [Card] = []
    
    
    private(set) var choosedIds: [Int]
    
    private static let colors: [Color] = [.red,.green,.blue]
    private static let shadings: [Shading] = [.diagonal,.hollow,.solid]
    private static let symbols: [Symbol] = [.diamond,.curve,.capsule]
    
    
    init() {
        deck = []
        tableTop = []
        choosedIds = []
        newGame()
    }
    
    mutating func choose(_ card: Card) {
        print(card)
        if let index = tableTop.indices.firstIndex(where: {tableTop[$0].id == card.id}){
            if card.isChoosing {
                tableTop[index].isChoosing.toggle()
                choosedIds = choosedIds.filter({$0 != card.id})
            }else{
                if choosedIds.count<3 {
                    tableTop[index].isChoosing.toggle()
                    choosedIds.append(card.id)
                }
            }
            if choosedIds.count>2 {
                match()
            }
        }
    }
    
    mutating func match() {
        if let firstCard = tableTop.first(where: {$0.id == choosedIds[0]}),
           let secondCard = tableTop.first(where: {$0.id == choosedIds[1]}),
           let thirdCard = tableTop.first(where: {$0.id == choosedIds[2]}){
            if superCompare(a: firstCard.content, b: secondCard.content, c: thirdCard.content) {
                for choosedId in choosedIds{
                    if let i = tableTop.indices.first(where: {tableTop[$0].id == choosedId}) {
                        cemetery.append(tableTop.remove(at: i))
                    }
                }
                if !deck.isEmpty {
                    tableTop.append(deck.removeFirst())
                    tableTop.append(deck.removeFirst())
                    tableTop.append(deck.removeFirst())
                }
            }else{
                for choosedId in choosedIds{
                    if let i = tableTop.indices.first(where: {tableTop[$0].id == choosedId}) {
                        tableTop[i].isChoosing = false
                    }
                }
            }
            choosedIds.removeAll()
        }
    }
    
    
    
    func superCompare(a:Card.Content,b:Card.Content,c:Card.Content) -> Bool {
        let colorSet: Set<Color> = [a.color,b.color,c.color]
        let symbolSet : Set<Symbol> = [a.symbol,b.symbol,c.symbol]
        let numSet : Set<Int> = [a.num,b.num,c.num]
        let shadingSet: Set<Shading> = [a.shading,b.shading,c.shading]
        
        if colorSet.count != 2 && symbolSet.count != 2 && numSet.count != 2 && shadingSet.count != 2  {
            return true
        }
        
        return false
    }
    
    
    
    
    mutating func newGame() {
        deck = []
        for colorIndex in 0...2 {
            let color = CardLogic.colors[colorIndex]
            for symbolIndex in 0...2 {
                let symbol = CardLogic.symbols[symbolIndex]
                for numIndex in 1...3 {
                    let num = numIndex
                    for shadingIndex in 0...2 {
                        let shading = CardLogic.shadings[shadingIndex]
                        let content = Card.Content(color: color, symbol: symbol, num: num, shading: shading)
                        let id = colorIndex*27+symbolIndex*9+numIndex*3+shadingIndex
                        deck.append(Card(id: id, content: content))
                    }
                }
            }
        }
        
//        deck.shuffle()
        
        tableTop = []
        for _ in 0..<12 {
            tableTop.append(deck.removeFirst())
            
        }
        
        choosedIds = []
        
    }
    
    
    
    mutating func deliver(){
        if !deck.isEmpty {
            for _ in 0...2 {
                tableTop.append(deck.removeFirst())
            }
        }
    }
    
    


    
}
