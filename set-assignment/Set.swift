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
    }
    
    func selectCard(at i:Int){
        cards[i].match()
    }
    
    func draw () -> Card {
        return cards.remove(at: cards.count.rand)
    }
    
    func getAvailableCards() -> [Card] {
        return cards.filter( {!$0.isMatched} )
    }
}

extension Int {
    var rand: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
