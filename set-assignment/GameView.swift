//
//  GameView.swift
//  set-assignment
//
//  Created by Mohamed Sherif on 7/6/18.
//  Copyright © 2018 Mohamed Sherif. All rights reserved.
//

import UIKit

class GameView: UIView {
    var cardsUI = [CardUIView]()
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        for card in cardsUI {
            card.draw(bounds)
        }
        
8    }
}
