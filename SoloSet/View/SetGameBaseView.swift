//
//  SetGameBaseView.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/15.
//

import SwiftUI

struct SetGameBaseView: View {
    @ObservedObject var game: SetGame
    @State var Showrule: Bool = false
    
    var body: some View {
        VStack{
            Text("Score:\(game.score)")
                .padding(.horizontal)
            Divider()
            HStack{
                Spacer()
                VStack{
                    if !game.cardsDeck.isEmpty{
                        HStack{
                            CardView(card: game.cardsDeck[0], themeColor: game.themeColor)
                                .aspectRatio(2/3, contentMode: .fit)
                                .frame(width: 60, height: 90, alignment: .center)
                                .onTapGesture {
                                    game.tip()
                                }
                            CardView(card: game.cardsDeck[1], themeColor: game.themeColor)
                                .aspectRatio(2/3, contentMode: .fit)
                                .frame(width: 60, height: 90, alignment: .center)
                            CardView(card: game.cardsDeck[2], themeColor: game.themeColor)
                                .aspectRatio(2/3, contentMode: .fit)
                                .frame(width: 60, height: 90, alignment: .center)
                        }
                    }else{
                        HStack{
                            ForEach(0..<3){_ in
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke()
                                    .aspectRatio(2/3, contentMode: .fit)
                                    .frame(width: 60, height: 90, alignment: .center)
                                    .foregroundColor(game.themeColor)
                            }
                        }
                    }
                    Text("Deck:\(game.cardsDeck.count)")
                        .padding(.horizontal)
                }
                Spacer()
                Spacer()
                VStack(alignment: .leading){
                    Label("Restart", systemImage: "gobackward")
                        .padding(5)
                        .onTapGesture {
                            game.newGame()
                        }
                    
                    Label("Deliver", systemImage: "rectangle.righthalf.inset.fill.arrow.right")
                        .padding(5)
                        .onTapGesture {
                            game.deliver()
                        }

                    Label("Rule", systemImage: "questionmark.square.dashed")
                        .padding(5)
                        .onTapGesture {
                            Showrule.toggle()
                        }
                        .sheet(isPresented: $Showrule, content: {
                            RuleSheet()
                        })
                }
                .foregroundColor(.blue)
                Spacer()
            }
        }
    }
}



struct GameControlView_Previews: PreviewProvider {
    static var previews: some View {
        let geme = SetGame()
        SetGameBaseView(game: geme)
    }
}
