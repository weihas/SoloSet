//
//  SoloSetApp.swift
//  SoloSet
//
//  Created by WeIHa'S on 2021/6/11.
//

import SwiftUI

@main
struct SoloSetApp: App {
    let game = SetGame()
    
    var body: some Scene {
        WindowGroup {
            SetGameView(game: game)
        }
    }
}
