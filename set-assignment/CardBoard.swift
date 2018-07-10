//
//  CardBoard.swift
//  set-assignment
//
//  Created by Mohamed Sherif on 7/6/18.
//  Copyright © 2018 Mohamed Sherif. All rights reserved.
//

import UIKit

class CardBoard: UIView {
    
    func addCard(toBeDrawn card: Card) {
//        drawnCards.append(CardUIView(frame: <#T##CGRect#>))
        let numberOfDrawnCards = subviews.count
        let numberOfRows = numberOfDrawnCards / 3
        let numberOfCardsInLastRow = (numberOfDrawnCards - numberOfRows * 3) % 3
        let startX = numberOfCardsInLastRow * Int(bounds.width / 3)
        let startY = numberOfRows * Int(bounds.height / 4)
        let cardView = CardUIView(frame: CGRect(x: startX, y: startY, width: Int(bounds.width/3), height: Int(bounds.height/4)))
        cardView.card = card
        addSubview(cardView)
        setNeedsDisplay()
        setNeedsLayout()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        print(bounds.height, bounds.width, subviews.count)
    }
    */

}
