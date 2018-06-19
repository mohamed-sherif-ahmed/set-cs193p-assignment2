//
//  Card.swift
//  set-assignment
//
//  Created by Mohamed Sherif on 6/16/18.
//  Copyright © 2018 Mohamed Sherif. All rights reserved.
//

import Foundation

enum Shape {
    case Triangle
    case Square
    case Circle
}

enum Shade {
    case Solid
    case Stripes
    case Dotted
}

enum Color {
    case White
    case Blue
    case Orange
}
class Card {
    var isMatched = false
    let shape: Shape
    let shade: Shade
    let color: Color
    let number: Int
    init(shape s: Shape, shade sd: Shade, color c: Color, number n: Int) {
        shape = s
        shade = sd
        color = c
        number = n
    }
    
    func match(){
        isMatched = true
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool{
        return lhs.shape == rhs.shape || lhs.shade == rhs.shade || lhs.color == rhs.color || lhs.number == rhs.number
    }
}
