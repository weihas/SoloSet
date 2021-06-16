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
            Divider()
            HStack{
                Spacer()
                VStack{
                    ZStack{
                        ForEach(0..<5){index in
                            CardBackView()
                                .aspectRatio(2/3, contentMode: .fit)
                                .frame(width: 100, height: 100, alignment: .center)
                                .offset(x: CGFloat(index*2), y: CGFloat(-index))
                        }
                    }
                    .onTapGesture {
                        game.tip()
                    }
                    Text("Deck:\(game.cardsDeck.count)")
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
