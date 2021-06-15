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
            Text("SoloSet")
                .font(.title)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(game.tabletopCards){card in
                        CardView(card: card, themeColor: game.themeColor)
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(5)
                            .onTapGesture {
                                game.choose(card)
                                if game.tabletopCards.isEmpty{
                                    win.toggle()
                                }
                            }
                    }
                }
            }.padding()
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
            GameControlView(game: game)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let geme = SetGame()
        SetGameView(game: geme)
    }
}
