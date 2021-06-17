//
//  RuleSheet.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/15.
//

import SwiftUI


struct RuleSheet: View {
    var exampleCards = ExampleCards().exampleCards
    var body: some View {
        ScrollView{
            VStack{
                Text("Title")
                    .font(.title)
                    .padding()
                Text("Introduce")
                    .padding()

                Text("Example")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                
                HStack{
                    CardView(card: exampleCards[0], themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: exampleCards[1], themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: exampleCards[2], themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                }
                .frame(height: 150)
                .padding()
                
                Text("Exa1").padding()

                HStack{
                    CardView(card: exampleCards[3], themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: exampleCards[4], themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: exampleCards[5], themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                }
                .frame(height: 150)
                .padding()
                
                Text("Exa2").padding()

                HStack{
                    CardView(card: exampleCards[6], themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: exampleCards[7], themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                    CardView(card: exampleCards[8], themeColor: .orange)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                }
                .frame(height: 150)
                .padding()
                
                Text("Exa3").padding()
            }
        }
        .foregroundColor(.accentColor)
    }
    
    
   
}

struct RuleSheet_Previews: PreviewProvider {
    static var previews: some View {
        RuleSheet()
            .environment(\.locale, Locale(identifier: "zh" ))
        RuleSheet()
            .environment(\.locale, Locale(identifier: "en" ))
    }
}







