//
//  CardBackView.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/12.
//

import SwiftUI

struct CardBackView: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
//                    .stroke(Color.black, lineWidth: 1)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.orange)
                Ellipse()
                    .foregroundColor(.black)
                    .opacity(0.3)
                    .padding(min(geometry.size.width,geometry.size.height) * 1/4)
            }
            .shadow(radius: geometry.size.width*1/30)
        }
    }
}

struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            CardBackView()
                .aspectRatio(2/3, contentMode: .fit)
            CardBackView()
                .aspectRatio(2/3, contentMode: .fit)
            CardBackView()
                .aspectRatio(2/3, contentMode: .fit)
        }
    }
}
