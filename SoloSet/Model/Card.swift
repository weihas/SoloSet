//
//  Card.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/11.
//

import SwiftUI

struct Card: Identifiable {
    let id: Int
    
    var isChoosing = false
    
    var isTipping = false
    var content: Content
    
    
    struct Content {
        let color: Color
        let symbol: ModelEnum.Symbol
        let num: Int
        let shading: ModelEnum.Shading
    }

}


