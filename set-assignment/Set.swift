//
//  Set.swift
//  set-assignment
//
//  Created by Mohamed Sherif on 6/16/18.
//  Copyright © 2018 Mohamed Sherif. All rights reserved.
//

import Foundation

class Set {
    private var cards = [Card]()
    
    private let shapes = [Shape.Circle, Shape.Square, Shape.Triangle]
    private let shades = [Shade.Dotted, Shade.Solid, Shade.Stripes]
    private let colors = [Color.Blue, Color.Orange, Color.White]
    
    init() {
        for s in 0..<3 {
            for sd in 0..<3 {
                for c in 0..<3 {
                    for n in 1...3 {
                        cards.append(Card(shape: shapes[s], shade: shades[sd], color: colors[c], number: n))
                    }
                }
            }
        }
        
        for _ in 0...500 {
            let random = Int(arc4random_uniform(81))
            let rCard = cards[random]
            cards.remove(at: random)
            cards.append(rCard)
        }
    }
    
    func selectCard(at i:Int){
        cards[i].isMatched = true
    }
    
    func getAvailableCards() -> [Card] {
        return cards.filter( {!$0.isMatched} )
    }
}
