//
//  SetGameView.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/11.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: SetGame
    
    @State var win: Bool = false
    
    var body: some View {
        VStack{
            AspectVGrid(items: game.tabletopCards, aspectRadio: 2/3) { card in
                CardView(card: card, themeColor: game.themeColor)
                    .onTapGesture {
                        game.choose(card)
                        win = game.win
                    }
                    .padding(8)
            }
            .padding()
            
            .alert(isPresented: $win) {
                Alert(title: Text("Win!"),message: Text("You have clear all the cards!."),
                      primaryButton: .default(
                        Text("Try Again"),
                        action: {
                            game.newGame()
                        }
                      ),
                      secondaryButton: .destructive(
                        Text("Exit"),
                        action: {
                            game.exit()
                        }
                      )
                )
            }
            SetGameBaseView(game: game)
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let geme = SetGame()
        SetGameView(game: geme)
    }
}
