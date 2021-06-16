//
//  SetGame.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/11.
//

import SwiftUI

class SetGame: ObservableObject {
    typealias Design = ModelEnum.Shading

    
    @Published private var cardLogic: CardLogic
    @Published private var theme: Theme

    init() {
        self.cardLogic = CardLogic()
        self.theme = Theme("Magic", .orange)
    }

    
    
    
    // MARK: -Access to the model
    var cardsDeck: Array<Card>{
        return cardLogic.deck
    }
    
    var tabletopCards: Array<Card>{
        return cardLogic.tableTop
    }
    
    var cardsCemetery: Array<Card>{
        return cardLogic.cemetery
    }
    
    var score: Int{
        return cardLogic.score
    }
    
    var win: Bool{
        return cardLogic.win
    }
    

    var themeColor: Color{
        return theme.ThemeColor
    }
    
    var themeName: String{
        return theme.ThemeName
    }
    

    
    
    
    // MARK: -Intent(s)
    func choose(_ card: Card) {
        cardLogic.choose(card)
    }
    func deliver() {
        cardLogic.deliver()
    }
    
    func newGame() {
        cardLogic.newGame()
    }
    
    func tip() {
        cardLogic.tip()
    }
    
    
    func exit() {
    }
    
    
}
